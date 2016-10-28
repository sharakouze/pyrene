using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Common.Tests.Shared
{
    public class Magasin
    {
        [PrimaryKey]
        public int CleMagasin { get; set; }

        public string CodMagasin { get; set; }
        public string LibMagasin { get; set; }
    }
}
