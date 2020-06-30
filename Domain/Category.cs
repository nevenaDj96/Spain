using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain
{
   public class Category : Entity
    {

        public string City { get; set; }
        [Required]
        public ICollection<Post> Posts { get; set; }
    }
}
