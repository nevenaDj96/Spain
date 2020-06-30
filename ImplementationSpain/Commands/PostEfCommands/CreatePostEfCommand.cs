using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.PostEfCommands
{
   public class CreatePostEfCommand : ICreatePostCommand
    {
        private readonly Context _context;
        private readonly CreatePostValidator _validator;

        public CreatePostEfCommand(Context context, CreatePostValidator validator)
        {
            _context = context;
            _validator = validator;

        }

        public int Id => 7;

        public string Name => "Create Post";

        public void Execute(CreatePostDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = new Post
            {

                Heading = request.Heading,
                Text = request.Text,
                UserId = request.UserId,
                PictureId = request.PictureId,
                CommNumb = request.CommentNumb,
                CategoryId = request.CategoryId,
                CreatedAt = DateTime.Now,
                IsDeleted = false,
                IsActive = true,
                ModifiedAt = null


            };

            _context.Posts.Add(post);
            _context.SaveChanges();
        }
    }
}
