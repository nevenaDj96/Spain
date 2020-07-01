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
    public class GetLikeEfQuery : IGetLikeQuery
    {

        private readonly Context _context;
    public GetLikeEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 31;

        public string Name => "Get Like";

        public GetLikeDto Execute(int request)
        {
            var query = _context.Likes.Include(l=>l.User).Include(l=>l.Post).Where(l=>l.Id ==request).FirstOrDefault();

            if (query == null)
                throw new SearchEntityNotFound("Like");
            return new GetLikeDto
            {
                Id = query.Id,
                UserName = query.User.UserName,
                Heading =query.Post.Heading,
                Text = query.Post.Text

                

            };
        }
    }
}
