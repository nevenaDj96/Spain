using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.RoleEfCommands
{
    public class CreateRoleEfCommand : ICreateRoleCommand
    {

        private readonly Context _context;
        private readonly CreateRoleValidator _validator;

        public CreateRoleEfCommand(Context context, CreateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 4;

        public string Name => "Create Role";

        public void Execute(CreateRoleDto request)
        {
            _validator.ValidateAndThrow(request);
            var role = new Role

            {
                Name = request.Name
           

            };

            _context.Roles.Add(role);
            _context.SaveChanges();
        }
    }
}
