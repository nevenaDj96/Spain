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
    public class GetUsersEfQuery : IGetUsersQuery
    {
        private readonly Context _context;

        public GetUsersEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 23;

        public string Name => "Get Users";

        public PagedResponse<GetUserDto> Execute(UserSearch search)
        {

            var query = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.UserName) || !string.IsNullOrWhiteSpace(search.UserName))
            {
                query = query.Where(x => x.UserName.ToLower().Contains(search.UserName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }

            var skipCount = search.PerPage * (search.PageNumber - 1);

            var response = new PagedResponse<GetUserDto>
            {
                CurrentPage = search.PageNumber,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new GetUserDto
                {
                    Id = x.Id,
                    UserName = x.UserName,
                    LastName = x.LastName,
                    FirstName = x.FirstName,

                }).ToList()
            };

            return response;
        }
    }

}
