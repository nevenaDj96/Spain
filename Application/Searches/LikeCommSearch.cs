using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
   public class LikeCommSearch : BaseSearch
    {
        public int? UserId { get; set; }
        public int? CommentId { get; set; }
        public string UserName { get; set; }

    }
}
