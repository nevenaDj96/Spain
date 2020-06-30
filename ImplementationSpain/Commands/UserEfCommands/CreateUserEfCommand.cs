using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.UserEfCommands
{
    public class CreateUserEfCommand : ICreateUserCommand
    {
        private readonly Context _context;
        private readonly CreateUserValidator _validator;

        public CreateUserEfCommand(Context context, CreateUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 1;

        public string Name => "Create user";

        public void Execute(CreateUserDto request)
        {


            _validator.ValidateAndThrow(request);

            var user = new User
            {
                UserName = request.UserName,
                Password = request.Password,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Email = request.Email,
                CreatedAt = DateTime.Now,
                IsDeleted = false,
                IsActive = true,
                RoleId = request.RoleId,
                ModifiedAt = null

            };

            _context.Users.Add(user);
            _context.SaveChanges();
        }
    }
}
