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
    public class GetCommentsEfQuery : IGetCommentsQuery
    {
        private readonly Context _context;
        public GetCommentsEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Name => "Get comments";

        public IEnumerable<GetCommentDto> Execute(CommentSearch search)
        {
            var query = _context.Comments.AsQueryable();

            if(search.Text != null)
            {
                if (!query.Any(c => c.Text.ToLower().Contains(search.Text.ToLower()))) {
                    throw new SearchEntityNotFound("Comment") ;
                }
                query = query.Where(c => c.Text.ToLower().Contains(search.Text.ToLower()));
            }
            if (search.UserName != null)
            {
                if (!query.Any(c => c.User.UserName.ToLower().Contains(search.UserName.ToLower())))
                {
                    throw new SearchEntityNotFound("Comment writen by this user");
                }
                query = query.Where(c => c.Text.ToLower().Contains(search.Text.ToLower()));
            }
            return query.Include(c => c.User).Include(c=>c.Post).Select(c => new GetCommentDto
            {
                Id = c.Id,
                Text = c.Text,
                Heading = c.Post.Heading,
                UserName = c.User.UserName,
                
            }).ToList();

        }
    }
}
