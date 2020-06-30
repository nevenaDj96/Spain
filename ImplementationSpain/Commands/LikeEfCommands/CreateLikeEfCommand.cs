using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.LikeEfCommands
{
    public class CreateLikeEfCommand : ICreateLikeCommand
    {
        private readonly Context _context;
        private readonly CreateLikeValidator _validator;

        public CreateLikeEfCommand(Context context, CreateLikeValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 19;

        public string Name => "Create like";

        public void Execute(InsertLikeDto request)
        {
            _validator.ValidateAndThrow(request);

            var like = new Like
            {

                UserId = request.UserId,
                PostId = request.PostId

            };

            _context.Likes.Add(like);
            _context.SaveChanges();


            
        }
    }
}
