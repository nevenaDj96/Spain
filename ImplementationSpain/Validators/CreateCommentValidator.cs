using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
   public class CreateCommentValidator : AbstractValidator<CreateCommentDto>
    {

        public CreateCommentValidator(Context context)
        {

            RuleFor(x => x.Text).NotEmpty()
                .MaximumLength(30);

            RuleFor(x => x.PostId).NotEmpty()
                .Must(id => context.Posts.Any(x => x.Id == id))
                .WithMessage("Posts doesnt exist");

            RuleFor(x => x.UserId).NotEmpty()
                .Must (id => context.Users.Any(x => x.Id == id))
                .WithMessage("User doesnt exist");

        }

    }
}
