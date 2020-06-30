using Application.DataTransfer;
using Application.Exceptions;
using Application.Queries;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
        public class GetLikeCommEfQuery : IGetLikeCommQuery
        {

            private readonly Context _context;
            public GetLikeCommEfQuery(Context context)
            {
                _context = context;
            }

            public int Id => 32;

            public string Name => "Get LikeComm";

            public GetLikeCommDto Execute(int request)
            {
                var query = _context.LikeComms.Find(request);

                if (query == null)
                    throw new SearchEntityNotFound("LikeComm");
                return new GetLikeCommDto
                {
                    Id = query.Id,
                    Text = query.Comment.Text


                };
            }
        }

    }
