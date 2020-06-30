using Application.Commands;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace EFCommands.UserEfCommands
{
    public class EfDeleteUserCommand : BaseEfCommand, IDeleteUserCommand
    {
        public EfDeleteUserCommand(Context context) : base(context)
        {
        }

        public void Execute(int request)
        {
            var user = Context.Users.Find(request);
            if (user==null)
            {
                throw 
            }
        }
    }
}
