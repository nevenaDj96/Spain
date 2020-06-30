using Application.Commands;
using Application.DataTransfer;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFCommands.UserEfCommands
{
    public class EfCreateUserCommand : BaseEfCommand, ICreateUserCommand
    {
        public EfCreateUserCommand(Context context) : base(context)
        {
        }

        public void Execute(CreateUserDto request)
        {
            Context.Users.Add(new Domain.User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                UserName = request.UserName,
                Email=request.Email,
                Password = request.Password,
                RoleId = 1,
                
            });

            Context.SaveChanges();
        }
    }
}
