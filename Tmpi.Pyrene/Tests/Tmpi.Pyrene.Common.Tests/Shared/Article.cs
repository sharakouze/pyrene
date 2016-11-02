using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Common.Tests.Shared
{
    public class Article
    {
        [PrimaryKey]
        public int CleArticle { get; set; }

        public string CodArticle { get; set; }
        public string LibArticle { get; set; }

        [References(typeof(Fourn))]
        public int CleFourn { get; set; }
        [Reference]
        public Fourn Fourn { get; set; }

        [References(typeof(Fourn))]
        public int CleFournFabricant { get; set; }
        [Reference]
        public Fourn FournFabricant { get; set; }

        [References(typeof(Magasin))]
        public int CleMagasin { get; set; }
        [Reference]
        public Magasin Magasin { get; set; }

        [Reference]
        public Magasin MagasinSecondaire { get; set; } // pas de foreign key associée !
    }
}
