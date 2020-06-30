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

namespace Implementation.Commands.PictureEfCommands
{
    public class EditPictureEfCommand : IEditPictureCommand
    {
        private readonly Context _context;
        private readonly CreatePictureValidator _validator;
        public EditPictureEfCommand(Context context, CreatePictureValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 11;

        public string Name => "Edit Picture";

        public void Execute(CreatePictureDto request)
        {
            _validator.ValidateAndThrow(request);

            var picture = _context.Pictures.Find(request.Id);
            if(picture == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Picture));
            }

            picture.Alt = request.Alt;
            picture.Route = request.Route;
            picture.CreatedAt = picture.CreatedAt;
            picture.IsActive = picture.IsActive;
            picture.ModifiedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
