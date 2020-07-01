using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Spain.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Anonymus";

        public IEnumerable<int> AllowedUseCases => new List<int> { 23,24,38,39,37,28,27,36,32,35,31,32,34,25,26,29,30 };
    }
}


//{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39}