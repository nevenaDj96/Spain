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

namespace Implementation.Commands.CategoryEfCommands
{
    public class EditCategoryEfCommand : IEditCategoryCommand
    {
        private readonly Context _context;
        private readonly CreateCategoryValidator _validator;

        public EditCategoryEfCommand(Context context, CreateCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 17;

        public string Name => "Edit Category";

        public void Execute(CreateCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = _context.Categories.Find(request.Id);

            if(category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            category.City = request.City;
            category.CreatedAt = category.CreatedAt;
            category.ModifiedAt = DateTime.Now;

            _context.SaveChanges();

        }
    }
}
