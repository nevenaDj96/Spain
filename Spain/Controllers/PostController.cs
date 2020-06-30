using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Application.DataTransfer;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Spain.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {

        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public PostController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }

        // GET: api/PostController
        [HttpGet]
        public IActionResult Get(
            [FromQuery] PostSearch search,
            [FromServices] IGetPostsQuery query            
            )
        {

            return Ok(_executor.ExecuteQuery(query, search));
            //var posts=_executor.ExecuteQuery(query, search);
            // return StatusCode(200,posts);
        }

        // GET: api/PostController/5

        [HttpGet("{id}")]
        public IActionResult Get(
            [FromServices] IGetPostQuery query,int id)
        {
            try
            {
                var post = _executor.ExecuteQuery(query, id);
                return StatusCode(200, post);
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

        // POST: api/PostController
        [HttpPost]
        public void Post([FromBody] CreatePostDto dto,
            [FromServices] ICreatePostCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }

        // PUT api/<PostController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<PostController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
