using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetCategoryEfQuery : IGetCategoryQuery
    {

        private readonly Context _context;
        public GetCategoryEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 29;

        public string Name => "Get Category";

        public GetCategoryDto Execute(int request)
        {
            var query = _context.Categories.Find(request);

            if (query == null)
                throw new SearchEntityNotFound("Category");
            return new GetCategoryDto
            {
                Id = query.Id,
               City = query.City

            };
        }

    }
}
