using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Infrastructure.Messages
{
    public interface IFilterableRequest
    {
        string Filter { get; set; }
    }
}
