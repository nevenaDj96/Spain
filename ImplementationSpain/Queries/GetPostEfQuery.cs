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
   public class GetPostEfQuery : IGetPostQuery
    {
        public int Id => 27;

        public string Name => "Get Post";

        private readonly Context _context;
        public GetPostEfQuery(Context context)
        {
            _context = context;
        }
        public GetPostDto Execute(int request)
        {
            var query = _context.Posts.Include(p => p.User).Include(p=>p.Comments).Include(p=>p.Picture).Include(p=>p.Category).Where(p => p.Id == request).FirstOrDefault();

            if (query == null)
                throw new SearchEntityNotFound("Post");

            return new GetPostDto
            {
                Id = query.Id,
                UserName = query.User.UserName,
                Heading = query.Heading,
                Text = query.Text,
                City = query.Category.City

            };
        }
    }
    }
