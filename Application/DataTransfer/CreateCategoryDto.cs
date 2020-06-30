using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Application.DataTransfer
{
   public class CreateCategoryDto
    {

        public int Id { get; set; }

       [RegularExpression(@"^[A-z\d\.\-]{3,50}$", ErrorMessage = "City must be between 2 and 30 characters.")]
        public string City { get; set; }
        public bool IsDeleted { get; set; }

    }
}
