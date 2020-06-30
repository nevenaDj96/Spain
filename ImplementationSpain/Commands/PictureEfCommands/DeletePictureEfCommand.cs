using Application.Commands;
using Application.Exceptions;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.PictureEfCommands
{
    public class DeletePictureEfCommand : IDeletePictureCommand
    {

        private readonly Context _context;

        public DeletePictureEfCommand(Context context)
        {
            _context = context;
        }

        public int Id => 12;

        public string Name => "Delete Picture";

        public void Execute(int request)
        {
            var picture = _context.Pictures.Find(request);

            if(picture ==null)
            {
                throw new EntityNotFoundException(request, typeof(Picture));
            }

            _context.Pictures.Remove(picture);
            _context.SaveChanges();
        }
    }
}
