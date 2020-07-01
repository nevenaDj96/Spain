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
    public class RoleController : ControllerBase
    {
        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public RoleController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }


        // GET: api/<RoleController>
        [HttpGet(Name ="Get Roles")]
        public IActionResult Get(
            [FromServices] IGetRolesQuery query,
            [FromQuery] RoleSearch search
            )
        {
            try
            {
                var r = _executor.ExecuteQuery(query, search);
                return StatusCode(200, r);
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

        // GET api/<RoleController>/5
        [HttpGet("{id}", Name = "Get Role")]
        public IActionResult Get(
            [FromServices] IGetRoleQuery query, int id)
        {
            try
            {
                var r = _executor.ExecuteQuery(query, id);
                return StatusCode(200, r);
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


        // POST api/<RoleController>
        [HttpPost(Name = "Create role")]
        public void Post([FromBody] CreateRoleDto dto,
            [FromServices] ICreateRoleCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }

        // PUT api/<RoleController>/5
        [HttpPut("{id}", Name = "Edit role")]
        public IActionResult Put(
           [FromServices] IEditRoleCommand command,
           [FromBody] CreateRoleDto dto, int id
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

        // DELETE api/<RoleController>/5
        [HttpDelete("{id}", Name = "Delete role")]
        public IActionResult Delete(int id,
           [FromServices] IDeleteRoleCommand command
           )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

        }
    }
}
