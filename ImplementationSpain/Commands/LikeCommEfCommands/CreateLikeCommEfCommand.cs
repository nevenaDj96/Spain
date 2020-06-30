using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.LikeCommEfCommands
{
    public class CreateLikeCommEfCommand : ICreateLikeCommCommand
    {
        private readonly Context _context;
        private readonly CreateLikeCommValidator _validator;

        public CreateLikeCommEfCommand(Context context, CreateLikeCommValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 20;

        public string Name => "Create likeCommentar";

        public void Execute(InsertLikeCommDto request)
        {
            _validator.ValidateAndThrow(request);

            var likeComm = new LikeComm
            {

                UserId = request.UserId,
                CommentId = request.CommentId

            };

            _context.LikeComms.Add(likeComm);
            _context.SaveChanges();



        }
    }
}