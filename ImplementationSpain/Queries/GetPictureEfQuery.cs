using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetPictureEfQuery : IGetPictureQuery
    {

        private readonly Context _context;
        public GetPictureEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 35;

        public string Name => "Get Picture";

        public GetPictureDto Execute(int request)
        {
            var query = _context.Pictures.Include(p => p.Posts).Where(p => p.Id == request).FirstOrDefault();

            if (query == null)
                throw new SearchEntityNotFound("Picture");
            return new GetPictureDto
            {
                Id = query.Id,
                Alt = query.Alt,
                Route = query.Route
                
                
                
            };
        }
    }
}
