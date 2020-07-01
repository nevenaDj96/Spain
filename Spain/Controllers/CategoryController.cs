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

        public class CategoryController : ControllerBase
        {
            private readonly IApplicationActor _actor;
            private readonly UseCaseExecutor _executor;

            public CategoryController(IApplicationActor actor, UseCaseExecutor executor)
            {
                _actor = actor;
                _executor = executor;
            }


            // GET: api/<CategoryController>
            [HttpGet]
            public IActionResult Get(
            [FromQuery] CategorySearch search,
            [FromServices] IGetCategoriesQuery query
            )
            {

            try
            {
                var cat = _executor.ExecuteQuery(query, search);
                return StatusCode(200, cat);
            }
            catch (SearchEntityNotFound e)
            {
                return StatusCode(404, e.Message);
            }
            catch (Exception e)
            {
                return StatusCode(500, e.Message);
            }

            // return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<CategoryController>/5
        [HttpGet("{id}", Name ="Get Category")]   

             public IActionResult Get(
               [FromServices] IGetCategoryQuery query, int id
                    )
                {
                 return Ok(_executor.ExecuteQuery(query, id));
             }

            // POST api/<CategoryController>
            [HttpPost]
          public void Post([FromBody] CreateCategoryDto dto,
            [FromServices] ICreateCategoryCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }


        // PUT api/<CategoryController>/5
        [HttpPut("{id}", Name = "Edit Category")]
        public IActionResult Put(
          [FromServices] IEditCategoryCommand command,
          [FromBody] CreateCategoryDto dto, int id
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


        // DELETE api/<CategoryController>/5
        [HttpDelete("{id}", Name = "Delete categogry")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteCategoryCommand command
            )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

        }
    }
    }
