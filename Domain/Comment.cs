using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain
{
   public class Comment : Entity
    {
        public string Text { get; set; }
        [Required]
        public Post Post { get; set; }
        public int PostId { get; set; }

        public User User { get; set; }

        public int UserId { get; set; }

        public ICollection<LikeComm> likeComms { get; set; }

    }
}
