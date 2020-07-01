using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateUserValidator : AbstractValidator<CreateUserDto>
    {

        public CreateUserValidator(Context context)
        {



            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Password).NotEmpty().MinimumLength(5);

            RuleFor(x => x.UserName)
                .NotEmpty()
                .MinimumLength(4)
                .Must(x => !context.Users.Any(user => user.UserName == x))
                .WithMessage("Username is already taken");

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .Must(x => !context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken");



        }
    }
}
