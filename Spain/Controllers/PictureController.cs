using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Spain.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
   
    public class PictureController : ControllerBase
    {
        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public PictureController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }
        // GET: api/<PictureController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<PictureController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<PictureController>
        [HttpPost]

        public IActionResult Post([FromServices] ICreatePictureCommand command,[FromForm] UploadPictureDto p)
        {
            try
            {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(p.Image.FileName);

                var newFileName = guid + extension;

                var path = Path.Combine("wwwroot", "img", newFileName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    p.Image.CopyTo(fileStream);
                }
                var dto = new CreatePictureDto
                {
                    Alt = p.Alt,
                    Route = newFileName
                };
                _executor.ExecuteCommand(command, dto);
                return Ok();

            }
            catch (EntityAlreadyExistsException e)
            {
                return StatusCode(404, e.Message);
            }
            catch (Exception ex) 
            {
                return StatusCode(500, ex.Message);
            }
        }

        // PUT api/<PictureController>/5
        [HttpPut("{id}")]
        public IActionResult Put([FromServices] IEditPictureCommand command, [FromForm] UploadPictureDto p,int id)
        {
            p.Id=id;
            try
            {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(p.Image.FileName);

                var newFileName = guid + extension;

                var path = Path.Combine("wwwroot", "img", newFileName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    p.Image.CopyTo(fileStream);
                }
                var dto = new CreatePictureDto
                {
                    Id=p.Id,
                    Alt = p.Alt,
                    Route = newFileName
                };
                _executor.ExecuteCommand(command, dto);
                return StatusCode(201);

            }
            catch (EntityAlreadyExistsException e)
            {
                return StatusCode(404, e.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // DELETE api/<PictureController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }



    public class UploadPictureDto
    {

        public int Id { get; set; }
        [Required]
        public string Alt { get; set; }
        [Required]
        public IFormFile Image { get; set; }

    }
}
