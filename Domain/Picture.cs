using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain
{
   public class Picture : Entity
    {

        public string Alt { get; set; }
        [Required]
        public string Route { get; set; }
        [Required]

        public ICollection<Post> Posts { get; set; }

    }
}
