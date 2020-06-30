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
    public class GetUserEfQuery : IGetUserQuery
    {
        private readonly Context _context;
public GetUserEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 24;

        public string Name => "Get User";

        public GetUserDto Execute(int request)
        {
            var query = _context.Users.Find(request);

            if (query == null)
                throw new SearchEntityNotFound("User");
            return new GetUserDto
            {
                Id = query.Id,
                UserName = query.UserName,
                FirstName = query.FirstName,
                LastName=query.LastName,
                Email=query.Email,
                Name = query.Role.Name,

            };
        }

     
    }
}
