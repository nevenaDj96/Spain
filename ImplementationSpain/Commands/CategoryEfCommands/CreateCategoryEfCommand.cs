using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CategoryEfCommands
{
    public class CreateCategoryEfCommand : ICreateCategoryCommand
    {
        private readonly Context _context;
        private readonly CreateCategoryValidator _validator;
        public CreateCategoryEfCommand(Context context, CreateCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
            
        }

        public int Id => 16;

        public string Name => "Create Category";

        public void Execute(CreateCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = new Category
            {
                City = request.City,
                CreatedAt = DateTime.Now,
                IsDeleted = false,
                IsActive = true,
                ModifiedAt = null

            };

            _context.Categories.Add(category);
            _context.SaveChanges();
        }
    }
}
