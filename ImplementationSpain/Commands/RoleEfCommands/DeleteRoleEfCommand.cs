using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.RoleEfCommands
{
    public class DeleteRoleEfCommand : IDeleteRoleCommand
    {
        private readonly Context _context;
    public DeleteRoleEfCommand(Context context)
        {
            _context = context;
        }

        public int Id => 5;

        public string Name => "Delete Role";

        public void Execute(int request)
        {
            var role = _context.Roles.Find(request);

            if(role == null)
            {
                throw new EntityNotFoundException(request, typeof(Role));
            }

            _context.Roles.Remove(role);
            _context.SaveChanges();
        }
    }
}
