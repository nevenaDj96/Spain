using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
   public class CreatePostDto
    {

        public int Id { get; set; }

        [Required]
       [MinLength(3, ErrorMessage = "Post heading must contain et least 3,up to 40 characters.")]
        public string Heading { get; set; }

        [Required]
       [MinLength(3, ErrorMessage = "Post text must contain et least 3 characters.")]
        public string Text { get; set; }
        [Required]
        public int CommentNumb { get; set; }
        public int UserId { get; set; }
        public int PictureId { get; set; }
        public int CategoryId { get; set; }
        [Required]
        public bool IsDeleted { get; set; }

    }
}
