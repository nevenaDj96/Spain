using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateCategoryValidator : AbstractValidator<CreateCategoryDto>
    {
        public CreateCategoryValidator(Context context)
        {

            RuleFor(x => x.City).NotEmpty()
                .MinimumLength(3)
                .MaximumLength(30);


        }

    }
}
