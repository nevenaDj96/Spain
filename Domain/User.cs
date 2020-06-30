using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain
{
    public class User : Entity
    {

        public string UserName { get; set; }
        [Required]
        
        public string Password { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public Role Role { get; set; }

        public int RoleId { get; set; }

        public ICollection<Post> Posts { get; set; }

        public ICollection<Comment> Comments { get; set; }
        public ICollection<LikeComm> LikeComms { get; set; }

        public ICollection<Like> Likes { get; set; }
        public virtual ICollection<UserUseCase> UserUseCases {get; set; }


    }
}
