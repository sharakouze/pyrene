using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Models.Messages.Responses
{
    public class SelectSocieteResponse
    {
        public IList Result { get; set; }

        public int TotalCount { get; set; }
    }
}
