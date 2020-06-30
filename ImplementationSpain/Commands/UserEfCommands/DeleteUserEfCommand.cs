using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.UserEfCommands
{
    public class DeleteUserEfCommand : IDeleteUserCommand
    {
        private readonly Context _context;

        public DeleteUserEfCommand(Context context)
        {
            this._context = context;
        }

        public int Id => 2;

        public string Name => "Delete User";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }
            _context.Users.Remove(user);

            _context.SaveChanges();
        }
    }
}
