using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using DataAccess;
using Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Queries
{
    public class GetRolesEfQuery : IGetRolesQuery
    {

        private readonly Context _context;

        public GetRolesEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 38;

        public string Name => "Get Roles";

        public IEnumerable<GetRoleDto> Execute(RoleSearch search)
        {

            var query = _context.Roles.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Include(r => r.Users).
               Select(r => new GetRoleDto
               {
                   Id = r.Id,
                   Name = r.Name,

               }).ToList();

        }
    }
}

