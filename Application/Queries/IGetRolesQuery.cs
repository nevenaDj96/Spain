﻿using Application.DataTransfer;
using Application.Interfaces;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetRolesQuery : IQuery<RoleSearch, IEnumerable<GetRoleDto>>
    {
    }
}