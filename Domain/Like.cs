using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Like : Entity
    { 
        public User User { get; set; }

        public int UserId { get; set; }

        public Post Post { get; set; }
        public int PostId { get; set; }
    }
}
