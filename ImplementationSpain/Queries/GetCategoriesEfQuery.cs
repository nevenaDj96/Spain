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
    public class GetCategoriesEfQuery : IGetCategoriesQuery
    {

            private readonly Context _context;

            public GetCategoriesEfQuery(Context context)
            {
                _context = context;
            }

            public int Id => 30;

            public string Name => "Get Categories";

            public PagedResponse<GetCategoryDto> Execute(CategorySearch search)
            {

                var query = _context.Categories.AsQueryable();

                if (!string.IsNullOrEmpty(search.City) || !string.IsNullOrWhiteSpace(search.City))
                {
                    query = query.Where(x => x.City.ToLower().Contains(search.City.ToLower()));
                }

                var skipCount = search.PerPage * (search.PageNumber - 1);

                var response = new PagedResponse<GetCategoryDto>
                {
                    CurrentPage = search.PageNumber,
                    ItemsPerPage = search.PerPage,
                    TotalCount = query.Count(),
                    Items = query.Skip(skipCount).Take(search.PerPage).Select(x => new GetCategoryDto
                    {
                        Id = x.Id,
                       City = x.City
                    }).ToList()
                };

                return response;
            }

        }
    }
