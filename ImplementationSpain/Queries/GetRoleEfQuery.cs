using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using DataAccess;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetRoleEfQuery : IGetRoleQuery
    {

        private readonly Context _context;
        public GetRoleEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 37;

        public string Name => "Get Role";

        public GetRoleDto Execute(int request)
        {
            var query = _context.Roles.Find(request);

            if (query == null)
                throw new SearchEntityNotFound("Role");
            return new GetRoleDto
            {
                Id = query.Id,
                Name = query.Name


            };
        }
    }
}
