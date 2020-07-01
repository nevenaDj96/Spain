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

namespace Implementation.Commands.PostEfCommands
{

    public class EditPostEfCommand : IEditPostCommand
    {
        private readonly Context _context;
        private readonly CreatePostValidator _validator;

        public EditPostEfCommand(Context context,CreatePostValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 9;

        public string Name => "Edit post";

        public void Execute(CreatePostDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = _context.Posts.Find(request.Id);


            
                if (post == null)
            {

                    throw new EntityNotFoundException(request.Id, typeof(Post));
            }

            post.Heading = request.Heading;
            post.Text = request.Text;
            post.UserId = request.UserId;
            post.PictureId = request.PictureId;
            post.CommNumb = request.CommentNumb;
            post.CategoryId = request.CategoryId;
            post.CreatedAt = post.CreatedAt;
            post.IsActive = post.IsActive;
            post.ModifiedAt = DateTime.Now;

            _context.SaveChanges();
        }   

    }
}
