using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
   public class CreatePictureDto
    {

        public int Id { get; set; }
        [Required]
        public string Alt { get; set; }
        [Required]
        
        public string Route { get; set; }
        public bool IsDeleted { get; set; }

    }
}
