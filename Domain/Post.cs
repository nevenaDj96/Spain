using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain
{
   public class Post : Entity
    {

        public string Heading { get; set; }
        [Required]
        public string Text { get; set; }
        [Required]
        public User User { get; set; }

        public int UserId { get; set; }

        public int CommNumb { get; set; }

        public Picture Picture { get; set; }

        public int PictureId { get; set; }

        public Category Category { get; set; }
        public int CategoryId { get; set; }

        public ICollection<Comment> Comments { get; set; }
        public ICollection<Like> Likes { get; set; }

    }
}
