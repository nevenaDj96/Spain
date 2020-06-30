using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
   public class EntityNotFoundException : Exception
    {
        private readonly int id;

        public EntityNotFoundException()
        {
        }

        public EntityNotFoundException(int id)
        {
            this.id = id;
        }

        public EntityNotFoundException(int id, Type type)
           : base($"Entity of type {type.Name} with an id of {id} was not found.")
        {

        }

    }
}
