using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Common.Tests.Shared
{
    public class Article
    {
        [PrimaryKey]
        public int CleArticle { get; set; }

        public string CodArticle { get; set; }
        public string LibArticle { get; set; }

        [References(typeof(Magasin))]
        public int CleMagasin { get; set; }

        [Reference]
        public Magasin Magasin { get; set; }

        [References(typeof(Magasin))]
        public int CleMagasinSecondaire { get; set; }

        [Reference]
        public Magasin MagasinSecondaire { get; set; }


    }
}
