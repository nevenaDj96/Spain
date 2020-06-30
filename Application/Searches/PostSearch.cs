using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
   public class PostSearch : BaseSearch
    {
        public string UserName { get; set; }
        public string Heading { get; set; }
        public string Category { get; set; }

        public string Text { get; set; }

    }
}
