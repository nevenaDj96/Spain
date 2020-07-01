using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetPicturesEfQuery : IGetPicturesQuery
    {

        private readonly Context _context;
        public GetPicturesEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 36;

        public string Name => "Get pictures";

        public IEnumerable<GetPictureDto> Execute(PictureSearch search)
        {
            var query = _context.Pictures.AsQueryable();
            if (search.Alt != null)
            {
                if (!query.Any(p => p.Alt.ToLower().Contains(search.Alt.ToLower())))
                {
                    throw new SearchEntityNotFound("Alt");

                }
            }

                return query.Include(p => p.Posts).Select(p => new GetPictureDto
                {
                    Id = p.Id,
                   Alt = p.Alt,
                   Route = p.Route

                }).ToList();
            }
        }
    }
