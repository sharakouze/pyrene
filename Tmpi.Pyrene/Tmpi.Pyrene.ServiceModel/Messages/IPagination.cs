using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public interface IPagination
    {
        int? Skip { get; set; }

        int? Take { get; set; }

        string[] Sort { get; set; }
    }
}
