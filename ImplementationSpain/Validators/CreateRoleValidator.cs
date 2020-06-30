using Application.DataTransfer;
using DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators
{
    public class CreateRoleValidator:AbstractValidator<CreateRoleDto>
    {

        public CreateRoleValidator(Context context)
        {
            RuleFor(x => x.Name).NotEmpty();
            RuleFor(x => x.Id).NotEmpty();
        }

    }
}
