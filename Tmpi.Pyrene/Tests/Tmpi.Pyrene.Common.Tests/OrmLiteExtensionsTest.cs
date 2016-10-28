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
    public class OrmLiteExtensionsTest
    {
        [Theory]
        [InlineData("codarticle, magasin(clemagasin,libmagasin), magasinsecondaire (libmagasin), libarticle")]
        public void ParseFields(string fields)
        {
            var lookup = OrmLiteExtensions.ParseFields<Article>(fields);

            Assert.True(true);
        }
    }
}
