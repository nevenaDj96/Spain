using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.LikeCommEfCommands
{
    public class DeleteLikeCommEfCommand : IDeleteLikeCommCommand
    {
        private readonly Context _context;

        public DeleteLikeCommEfCommand(Context context)
        {
            _context = context;
        }
        public int Id => 22;

        public string Name => "Delete likeComm";

        public void Execute(int request)
        {
            var likeComm = _context.LikeComms.Find(request);

            if (likeComm == null)
            {
                throw new EntityNotFoundException(request, typeof(LikeComm));
            }

            _context.LikeComms.Remove(likeComm);
            _context.SaveChanges();
        }
    }
}