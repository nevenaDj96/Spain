﻿using Application.DataTransfer;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetLikeCommQuery : IQuery<int, GetLikeCommDto>
    {
    }
}
