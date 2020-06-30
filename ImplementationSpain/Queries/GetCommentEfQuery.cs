using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetCommentEfQuery : IGetCommentQuery
    {
        private readonly Context _context;

        public GetCommentEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 26;

        public string Name => "Get Comment";

        public GetCommentDto Execute(int request)
        {
            var query = _context.Comments.Find(request);

            if (query == null)
                throw new EntityNotFoundException();
            return new GetCommentDto
            {
                Id = query.Id,
                Text = query.Text,
                Heading = query.Post.Text,
                UserName = query.User.UserName

            };
        }
    }
}
