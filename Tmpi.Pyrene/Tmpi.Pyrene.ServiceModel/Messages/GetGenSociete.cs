using ServiceStack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    [Route("/GenSociete/{CleSociete}")]
    public class GetGenSociete
    {
        public int CleSociete { get; set; }
    }
}
