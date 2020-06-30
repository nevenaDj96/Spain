using Application.DataTransfer;
using Application.Interfaces;
using Application.Queries;
using Application.Searches;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetLikesEfQuery : IGetLikesQuery
    {
        public int Id => throw new NotImplementedException();

        public string Name => throw new NotImplementedException();

        public IEnumerable<GetLikeDto> Execute(LikeSearch search)
        {
            throw new NotImplementedException();
        }
    }

}
