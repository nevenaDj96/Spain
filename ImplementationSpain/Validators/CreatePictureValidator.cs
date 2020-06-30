using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreatePictureValidator : AbstractValidator<CreatePictureDto>
    {

        public CreatePictureValidator(Context context)
        {
            RuleFor(x => x.Alt).NotEmpty()
                .MinimumLength(3)
                .MaximumLength(20);

         

            //RuleFor(x => x.Route).NotEmpty()
            //    .Must(x => x.Equals("image/jpeg") || x.Equals("image/jpg") || x.Equals("image/png"))
            //    .WithMessage("File type is wrong");


        }

    }
}
