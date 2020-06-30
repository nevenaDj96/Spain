using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer
{
   public class GetCommentDto
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public string UserName { get; set; }
        public string Heading { get; set; }

    }
}
