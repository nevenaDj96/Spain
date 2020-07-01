using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Spain.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LikeController : ControllerBase
    {
        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public LikeController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }

        // GET: api/<LikeController>
        [HttpGet(Name = "Get likes")]
        public IActionResult Get(
          [FromServices] IGetLikesQuery query,
          [FromQuery] LikeSearch search
          )
        { 
            try
            {
                var l = _executor.ExecuteQuery(query, search);
                return StatusCode(200, l);
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
        // GET api/<LikeController>/5
        [HttpGet("{id}", Name = "Get like")]
        public IActionResult Get(
           [FromServices] IGetLikeQuery query, int id)
        {
            try
            {
                var l = _executor.ExecuteQuery(query, id);
                return StatusCode(200, l);
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

        // POST api/<LikeController>
        [HttpPost(Name = "Create like")]
        public void Post([FromBody] InsertLikeDto dto,
             [FromServices] ICreateLikeCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }


        // PUT api/<LikeController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<LikeController>/5
        [HttpDelete("{id}", Name = "Delete like")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteLikeCommand command
            )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

        }
    }
}
