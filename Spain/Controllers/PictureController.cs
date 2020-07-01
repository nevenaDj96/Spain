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
using Application.Queries;
using Application.Searches;
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
        public IActionResult Get(
            [FromQuery] PictureSearch search,
            [FromServices] IGetPicturesQuery query
            )
        {

            try
            {
                var pics = _executor.ExecuteQuery(query, search);
                return StatusCode(200, pics);
            }
            catch (SearchEntityNotFound e)
            {
                return StatusCode(404, e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        // GET api/<PictureController>/5
        [HttpGet("{id}", Name = "Get Picture")]
        public IActionResult Get(
               [FromServices] IGetPictureQuery query, int id
                    )
        {
            try
            {
                return Ok(_executor.ExecuteQuery(query, id));
            }

            catch (SearchEntityNotFound e)
            {
                return StatusCode(404, e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }
        }

        // POST api/<PictureController>
        [HttpPost]

        public IActionResult Post([FromServices] ICreatePictureCommand command, [FromForm] UploadPictureDto p)
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
        [HttpPut("{id}", Name = "Edit Picture")]
        public IActionResult Put([FromServices] IEditPictureCommand command,
            [FromForm] UploadPictureDto p, int id)
        {
            p.Id = id;
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
                    Id = p.Id,
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
        [HttpDelete("{id}", Name = "Delete Picture")]

        public IActionResult Delete(int id,
            [FromServices] IDeletePictureCommand command
            )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

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
}
