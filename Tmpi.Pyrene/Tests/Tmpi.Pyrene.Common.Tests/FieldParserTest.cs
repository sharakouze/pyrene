using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tmpi.Pyrene.Common.OrmLite;
using Tmpi.Pyrene.Common.Tests.Shared;
using Xunit;

namespace Tmpi.Pyrene.Common.Tests
{
    public class FieldParserTest
    {
        [Fact]
        public void ParseFields()
        {
            string fields = "codarticle, magasin, fourn (libfourn), fournfabricant(codfourn,libfourn), libarticle";

            var fp = new FieldParser();
            var lookup = fp.Parse<Article>(fields);

            Assert.True(true);
        }
    }
}
