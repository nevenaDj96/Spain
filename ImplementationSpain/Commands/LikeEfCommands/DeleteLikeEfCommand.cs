using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.LikeEfCommands
{
    public class DeleteLikeEfCommand : IDeleteLikeCommand
    {
        private readonly Context _context;

        public DeleteLikeEfCommand(Context context)
        {
            _context = context;
        }
        public int Id => 21;

        public string Name => "Delete like";

        public void Execute(int request)
        {
            var like = _context.Likes.Find(request);

            if(like == null)
            {
                throw new EntityNotFoundException(request, typeof(Like));
            }

            _context.Likes.Remove(like);
            _context.SaveChanges();
        }
    }
}
