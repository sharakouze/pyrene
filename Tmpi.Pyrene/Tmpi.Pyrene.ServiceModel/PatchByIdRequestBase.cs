using System.Collections.Generic;

namespace Tmpi.Pyrene.ServiceModel
{
    public abstract class PatchByIdRequestBase
    {
        public int Id { get; set; }

        public List<PatchElement> Fields { get; set; }
    }
}
