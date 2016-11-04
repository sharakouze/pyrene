using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Common.Tests.Shared
{
    public class Pays
    {
        [PrimaryKey]
        public int ClePays { get; set; }

        public string NomPays { get; set; }
    }
}
