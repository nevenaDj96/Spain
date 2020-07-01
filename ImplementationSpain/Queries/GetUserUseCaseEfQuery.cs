using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetUserUseCaseEfQuery : IGetUserUseCase
    {
        private readonly Context _context;
        public GetUserUseCaseEfQuery(Context context)
        {
            _context = context;
        }

        public int Id => 39;

        public string Name => "Get UserUseCase";

        public GetUserUseCaseDto Execute(int request)
        {
            var query = _context.UserUseCases.Find(request);

            if (query == null)
                throw new SearchEntityNotFound("UserUseCase");
            return new GetUserUseCaseDto
            {
                Id = query.Id,
                UserId = query.UserId,
                UseCaseId = query.UseCaseId


            };
        }
    }
}
