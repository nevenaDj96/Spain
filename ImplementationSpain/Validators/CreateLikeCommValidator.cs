using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
   public class CreateLikeCommValidator : AbstractValidator<InsertLikeCommDto>
    {

        public CreateLikeCommValidator(Context context)
        {
            RuleFor(x => x.Id).NotEmpty();

            RuleFor(x => x.UserId).NotEmpty()
                .NotEmpty()
                .Must(id => context.Users.Any(x => x.Id == id))
                .WithMessage("User doesnt exist");

            RuleFor(x => x.CommentId)
               .NotEmpty()
               .Must(id => context.Comments.Any(x => x.Id == id))
                .WithMessage("Comment doesnt exist");

        }

    }
}
