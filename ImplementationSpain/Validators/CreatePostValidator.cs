using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreatePostValidator : AbstractValidator<CreatePostDto>
    {

       public CreatePostValidator(Context context)
        {
            RuleFor(x => x.Heading).NotEmpty()
                .MaximumLength(50)
                .MinimumLength(3);

            RuleFor(x => x.Text).NotEmpty()
                .MinimumLength(5);


            RuleFor(x => x.UserId).NotEmpty()
                .Must(id => context.Users.Any(x => x.Id == id))
                .WithMessage("User doesnt exist");
        }

    }
}
