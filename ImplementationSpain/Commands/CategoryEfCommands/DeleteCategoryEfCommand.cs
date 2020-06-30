using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CategoryEfCommands
{
    public class DeleteCategoryEfCommand : IDeleteCategoryCommand
    {
        private readonly Context _context;

        public DeleteCategoryEfCommand(Context context)
        {
            _context = context;
        }

        public int Id => 18;

        public string Name => "Delete Category";

        public void Execute(int request)
        {
            var category = _context.Categories.Find(request);

            if(category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            _context.Categories.Remove(category);
            _context.SaveChanges();
        }
    }
}
