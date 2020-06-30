using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.CommentEfCommands
{
    public class DeleteCommentEfCommand : IDeleteCommentCommand
    {
        private readonly Context _context;
    public DeleteCommentEfCommand(Context context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Name => "Delete Comment";

        public void Execute(int request)
        {
            var comment = _context.Comments.Find(request);

            if(comment == null)
            {
                throw new EntityNotFoundException(request, typeof(Comment));
            }

            _context.Comments.Remove(comment);
            _context.SaveChanges();
        }
    }
}
