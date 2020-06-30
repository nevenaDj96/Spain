using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CommentEfCommands
{
    public class EditCommentEfCommand : IEditCommentCommand
    {
        public readonly Context _context;
        private readonly CreateCommentValidator _validator;

        public EditCommentEfCommand(Context context, CreateCommentValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 14;

        public string Name => "Edit Comment";

        public void Execute(CreateCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var comment = _context.Comments.Find(request.Id);

            if(comment == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Comment));
            }

            comment.Text = request.Text;
            comment.UserId = request.UserId;
            comment.PostId = request.PostId;
            comment.ModifiedAt = DateTime.Now;
            comment.CreatedAt = comment.CreatedAt;

            _context.SaveChanges();
            _context.SaveChanges();
        }
    }
}
