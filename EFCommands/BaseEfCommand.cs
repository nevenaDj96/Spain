using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFCommands
{
    public abstract class BaseEfCommand 
    {
        protected BaseEfCommand(Context context)
        {
            Context = context;
        }

        protected Context Context { get; }

    }
}
