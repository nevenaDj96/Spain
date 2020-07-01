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
    public class UserController : ControllerBase
    {

        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public UserController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }


        // GET: api/<UserController>
        [HttpGet(Name = "Get Users")]
        public IActionResult Get(
            [FromQuery] UserSearch search,
            [FromServices] IGetUsersQuery query
            )
        {
            try
            {
                //return Ok(_executor.ExecuteQuery(query, search));
                var users = _executor.ExecuteQuery(query, search);
                return StatusCode(200, users);
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

        // GET api/<UserController>/5
        [HttpGet("{id}", Name = "Get User")]
        public IActionResult Get(
            [FromServices] IGetUserQuery query, int id)
        {
            try
            {
                var user = _executor.ExecuteQuery(query, id);
                return StatusCode(200, user);
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

        // POST api/<UserController>
        [HttpPost(Name = "Create User")]
        public void Post([FromBody] CreateUserDto dto,
            [FromServices] ICreateUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }

        // PUT api/<UserController>/5
        [HttpPut("{id}", Name = "Edit User")]
        public IActionResult Put(
           [FromServices] IEditUserCommand command,
           [FromBody] CreateUserDto dto, int id
           )
        {
            dto.Id = id;
            try
            {

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

        // DELETE api/<UserController>/5
        [HttpDelete("{id}", Name = "Delete User")]
        public IActionResult Delete(int id,
           [FromServices] IDeleteUserCommand command
           )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

        }
    }
}
