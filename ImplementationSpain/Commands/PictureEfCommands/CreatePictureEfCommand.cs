using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.PictureEfCommands
{
    public class CreatePictureEfCommand : ICreatePictureCommand
    {
        private readonly Context _context;
        private readonly CreatePictureValidator _validator;

        public CreatePictureEfCommand(Context context, CreatePictureValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 10;

        public string Name => "Create Picture";

        public void Execute(CreatePictureDto request)
        {
            _validator.ValidateAndThrow(request);
            var picture = new Picture
            {

                Alt = request.Alt,
                Route = request.Route,
                CreatedAt = DateTime.Now,
                ModifiedAt = null,
                IsDeleted = false,
                IsActive = true,


            };

            _context.Pictures.Add(picture);
            _context.SaveChanges();
        }
    }
}
