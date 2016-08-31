using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.ServiceModel.Types
{
    public interface IHasCodLibTxt
    {
        string CodObjet { get; set; }
        string LibObjet { get; set; }
        string TxtObjet { get; set; }
    }
}
