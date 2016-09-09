using System.Collections.Generic;

namespace Tmpi.Pyrene.Infrastructure
{
    public abstract class PatchByIdRequestBase<TKey>
    {
        public TKey Id { get; set; }

        public List<PatchElement> Fields { get; set; }
    }
}
