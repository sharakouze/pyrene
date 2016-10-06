using ServiceStack.Model;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
    public class BasicEntity : IHasId<int>
    {
        public int Id { get; set; }

        public string CodObjet { get; set; }

        public string LibObjet { get; set; }

        public bool EstActif { get; set; }
    }
}
