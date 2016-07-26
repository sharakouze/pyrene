using System.Collections.Generic;
using Tmpi.Pyrene.Infrastructure.Messages;

namespace Tmpi.Pyrene.Core.Models.Messages.Requests
{
    public class SelectSociete : IPaginableRequest
    {
        public IEnumerable<int> CleSocieteList { get; set; } = new List<int>();

        public string ResultType { get; set; }

        public int Skip { get; set; }

        public string[] Sort { get; set; }

        public int Take { get; set; }
    }
}
