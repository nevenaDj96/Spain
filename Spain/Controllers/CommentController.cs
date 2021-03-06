﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using Implementation.Queries;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Spain.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {

        private readonly IApplicationActor _actor;
        private readonly UseCaseExecutor _executor;

        public CommentController(IApplicationActor actor, UseCaseExecutor executor)
        {
            _actor = actor;
            _executor = executor;
        }


        // GET: api/<CommentController>
        [HttpGet(Name ="Get comments")]
        public IActionResult Get(
            [FromServices] IGetCommentsQuery query,
            [FromQuery] CommentSearch search
            )
        {
            try
            {
                var comm = _executor.ExecuteQuery(query, search);
                return StatusCode(200, comm);
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

        // GET api/<CommentController>/5
        [HttpGet("{id}", Name ="Get Comment")]
        public IActionResult Get(
            [FromServices] IGetCommentQuery query, int id)
        {
            try
            {
                var comm = _executor.ExecuteQuery(query, id);
                return StatusCode(200, comm);
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

        // POST api/<CommentController>
        [HttpPost(Name ="Create comment")]
        public void Post([FromBody] CreateCommentDto dto,
            [FromServices] ICreateCommentComand command)
        {
            _executor.ExecuteCommand(command, dto);
        }


        // PUT api/<CommentController>/5
        [HttpPut("{id}", Name = "Edit Comment")]
        public IActionResult Put(
           [FromServices] IEditCommentCommand command,
           [FromBody] CreateCommentDto dto, int id
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


        // DELETE api/<CommentController>/5
        [HttpDelete("{id}", Name = "Delete comment")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteCommentCommand command
            )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(200);

        }
    }
}
