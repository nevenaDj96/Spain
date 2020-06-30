using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.PostEfCommands
{
    public class DeletePostEfCommand : IDeletePostCommand
    {

        private readonly Context _context;

        public DeletePostEfCommand(Context context)
        {
            _context = context;
        }

        public int Id => 8;

        public string Name => "Delete Post";

        public void Execute(int request)
        {
            var post = _context.Posts.Find(request);

            if(post == null)
            {
                throw new EntityNotFoundException(request, typeof(Post));
            }

            _context.Posts.Remove(post);
            _context.SaveChanges();
        }
    }
}
