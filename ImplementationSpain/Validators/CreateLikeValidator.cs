using Application.DataTransfer;
using DataAccess;
using Domain;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateLikeValidator : AbstractValidator<InsertLikeDto>
    {

        public CreateLikeValidator(Context context)
        {
            RuleFor(x => x.Id).NotEmpty();

            RuleFor(x => x.PostId)
                .NotEmpty()
                .Must(id => context.Posts.Any(x => x.Id == id))
                .WithMessage("Post doesnt exist");

            RuleFor(x => x.UserId)
               .NotEmpty()
                .Must(id => context.Users.Any(x => x.Id == id))
                .WithMessage("User doesnt exist");



        }

    }
}
