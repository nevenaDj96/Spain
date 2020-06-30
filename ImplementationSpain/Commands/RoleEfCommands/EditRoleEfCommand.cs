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

namespace Implementation.Commands.RoleEfCommands
{
    public class EditRoleEfCommand : IEditRoleCommand
    {

        private readonly Context _context;
        private readonly CreateRoleValidator _validator;
        public EditRoleEfCommand(Context context, CreateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 6;

        public string Name => "Edit Role";



        public void Execute(CreateRoleDto request)
        {
            _validator.ValidateAndThrow(request);
            var role = _context.Roles.Find(request.Id);
             if(role==null)
              {
                   throw new EntityNotFoundException(request.Id,typeof(Role));
              }


            role.Name = request.Name;
            role.ModifiedAt = DateTime.Now;
            role.CreatedAt = role.CreatedAt;

            _context.SaveChanges();
        }

    }

}

