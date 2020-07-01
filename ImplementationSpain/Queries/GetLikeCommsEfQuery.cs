using Application.DataTransfer;
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
    public class GetLikeCommsEfQuery : IGetLikeCommsQuery
    {

        private readonly Context _context;
        public GetLikeCommsEfQuery(Context context)
        {
            _context = context;
        }



        public int Id => 34;

        public string Name => "Get LikeComms";

        public IEnumerable<GetLikeCommDto> Execute(LikeCommSearch search)
        {
            var query = _context.LikeComms.AsQueryable();

            return query.Include(l => l.User).Include(l=>l.Comment).Select(l => new GetLikeCommDto
            {
                Id = l.Id,
                Text = l.Comment.Text,
                UserName = l.User.UserName

            }).ToList();
        }
    }

}
