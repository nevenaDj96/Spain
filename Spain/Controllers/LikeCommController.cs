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
    public class LikeCommController : ControllerBase
    {

        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public LikeCommController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }

        // GET: api/<LikeCommController>


        [HttpGet(Name = "Get likecomms")]
        public IActionResult Get(
          [FromServices] IGetLikeCommsQuery query,
          [FromQuery] LikeCommSearch search
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

        // GET api/<LikeCommController>/5
        [HttpGet("{id}", Name = "Get likecomm")]
        public IActionResult Get(
            [FromServices] IGetLikeCommQuery query, int id)
        {
            try
            {
                var lc = _executor.ExecuteQuery(query, id);
                return StatusCode(200, lc);
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

        // POST api/<LikeCommController>
        [HttpPost(Name = "Create likecomm")]
        public void Post([FromBody] InsertLikeCommDto dto,
              [FromServices] ICreateLikeCommCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }

        // PUT api/<LikeCommController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<LikeCommController>/5
        [HttpDelete("{id}", Name = "Delete likecomm")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteLikeCommCommand command
            )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

        }
    }
}
