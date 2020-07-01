using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CommentEfCommands
{
    public class CreateCommentEfCommand : ICreateCommentComand
    {
        private readonly Context _context;
        private readonly CreateCommentValidator _validator;

        public CreateCommentEfCommand(Context context, CreateCommentValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 13;

        public string Name => "Create Comment";

        public void Execute(CreateCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var comment = new Comment
            {
                Text = request.Text,
                UserId = request.UserId,
                PostId = request.PostId
            
            };

            _context.Comments.Add(comment);
            _context.SaveChanges();
        }
    }
}
