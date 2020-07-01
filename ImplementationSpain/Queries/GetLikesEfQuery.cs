using Application.DataTransfer;
using Application.Interfaces;
using Application.Queries;
using Application.Searches;
using DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetLikesEfQuery : IGetLikesQuery
    {

        private readonly Context _context;
        public GetLikesEfQuery(Context context)
        {
            _context = context;
        }



        public int Id =>32;

        public string Name => "Get Likes";

        public IEnumerable<GetLikeDto> Execute(LikeSearch search)
        {
            var query =_context.Likes.AsQueryable();
            return query.Include(l => l.User).Include(l=>l.Post).Select(l => new GetLikeDto
            {
                Id = l.Id,
                Heading = l.Post.Heading,
                UserName = l.User.UserName,
                Text = l.Post.Text

            }).ToList();
        }
    }

}
