using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
   public class GetPostsEfQuery : IGetPostsQuery
    {

        private readonly Context _context;

        public GetPostsEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 28;

        public string Name => "Get Posts";

        public PagedResponse<GetPostDto> Execute(PostSearch search)
        {
            var query = _context.Posts.AsQueryable();

            if (!string.IsNullOrEmpty(search.UserName) || !string.IsNullOrWhiteSpace(search.UserName))
            {
                query = query.Where(x => x.User.UserName.ToLower().Contains(search.UserName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Heading) || !string.IsNullOrWhiteSpace(search.Heading))
            {
                query = query.Where(x => x.Heading.ToLower().Contains(search.Heading.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Text) || !string.IsNullOrWhiteSpace(search.Text))
            {
                query = query.Where(x => x.Text.ToLower().Contains(search.Text.ToLower()));
            }


            if (!string.IsNullOrEmpty(search.Category) || !string.IsNullOrWhiteSpace(search.Category))
            {
                query = query.Where(x => x.Category.City.ToLower().Contains(search.Category.ToLower()));
            }

            var skipCount = search.PerPage * (search.PageNumber - 1);

            var response = new PagedResponse<GetPostDto>
            {
                CurrentPage = search.PageNumber,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new GetPostDto
                {
                    Id = x.Id,
                    UserName = x.User.UserName,
                    Text = x.Text,
                    Heading = x.Heading,
                    City = x.Category.City

                }).ToList()
            };

            return response;
        }
    }
}
