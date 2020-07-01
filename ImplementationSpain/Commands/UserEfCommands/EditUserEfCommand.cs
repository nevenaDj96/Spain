using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.UserEfCommands
{
    public class EditUserEfCommand : IEditUserCommand
    {
        private readonly Context _context;
        private readonly CreateUserValidator _validator;

        public EditUserEfCommand(Context context, CreateUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 3;

        public string Name => "Edit User";



        public void Execute( CreateUserDto request)
        {

            var user = _context.Users.Find(request.Id);

            if (user.UserName.ToLower() != request.UserName.ToLower().Trim())
            {
                if (_context.Users.Any(p => p.UserName.ToLower() == request.UserName.ToLower().Trim()))
                    throw new EntityAlreadyExistsException("User with that username");

            }
            if (user.Email.ToLower() != request.Email.ToLower().Trim())
            {
                if (_context.Users.Any(p => p.Email.ToLower() == request.Email.ToLower().Trim()))
                    throw new EntityAlreadyExistsException("User with that e-mail");
            }
             if (user==null)
               {
                   throw new EntityNotFoundException(request.Id, typeof(User));
              }

            user.UserName = request.UserName;
            user.Password = request.Password;
            user.Email = request.Email;
            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.ModifiedAt = DateTime.Now;
            user.RoleId = request.RoleId;
            user.CreatedAt = user.CreatedAt;

            _context.SaveChanges();
        }
    }
}
