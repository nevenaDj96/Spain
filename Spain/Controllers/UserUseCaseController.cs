using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Exceptions;
using Application.Queries;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Spain.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserUseCaseController : ControllerBase
    {

        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public UserUseCaseController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }


        // GET: api/<UserUseCaseController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<UserUseCaseController>/5
        [HttpGet("{id}", Name="Get UserUseCase")]
        public IActionResult Get(
           [FromServices] IGetUserUseCase query, int id)
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

        // POST api/<UserUseCaseController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<UserUseCaseController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<UserUseCaseController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
