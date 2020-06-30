using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
   public class SearchEntityNotFound : Exception
    {

        public SearchEntityNotFound(string str)
   : base($"{str} was not found.")
        {

        }
    }
}
