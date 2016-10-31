using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Common.Tests.Shared
{
    public class Fourn
    {
        [PrimaryKey]
        public int CleFourn { get; set; }

        public string CodFourn { get; set; }
        public string LibFourn { get; set; }
    }
}
