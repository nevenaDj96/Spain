using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
   public class LikeComm : Entity
    {
        public User User { get; set; }

        public int UserId { get; set; }

        public Comment Comment { get; set; }

        public int CommentId { get; set; }

    }
}
