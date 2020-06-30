using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
   public class LikeSearch : BaseSearch
    {
        public int? PostId { get; set; }
        public int? UserId { get; set; }

        public string UserName { get; set; }
        public string Heading { get; set; }

    }
}
