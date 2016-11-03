using System;
using System.Collections.Generic;
using System.Linq;
using Tmpi.Pyrene.Common.OrmLite;
using Tmpi.Pyrene.Common.Tests.Shared;
using Xunit;

namespace Tmpi.Pyrene.Common.Tests
{
    public class FieldParserTest
    {
        [Fact]
        public void ShouldHaveErrorsWhenFieldNotFound()
        {
            string fields = "foo,clearticle,bar,fourn(plop)";

            var parser = new FieldParser();
            parser.Load<Article>(fields);

            Assert.True(parser.HasErrors);

            var errors = parser.GetErrors();
            Assert.Equal(2, errors.Count);

            var q1 = errors.Where(x => x.Key == typeof(Article)).SelectMany(x => x);
            Assert.Contains("foo", q1);
            Assert.Contains("bar", q1);
            Assert.DoesNotContain("plop", q1);
            Assert.DoesNotContain("clearticle", q1, StringComparer.OrdinalIgnoreCase);

            var q2 = errors.Where(x => x.Key == typeof(Fourn)).SelectMany(x => x);
            Assert.DoesNotContain("foo", q2);
            Assert.DoesNotContain("bar", q2);
            Assert.Contains("plop", q2);
            Assert.DoesNotContain("clearticle", q2, StringComparer.OrdinalIgnoreCase);
        }

        [Fact]
        public void ShouldHaveErrorsWhenForeignKeyNotFound()
        {
            string fields = "CleArticle,MagasinSecondaire";

            var parser = new FieldParser();
            parser.Load<Article>(fields);

            Assert.True(parser.HasErrors);

            var errors = parser.GetErrors();
            Assert.Equal(1, errors.Count);

            var q1 = errors.Where(x => x.Key == typeof(Article)).SelectMany(x => x);
            Assert.Contains("MagasinSecondaire", q1);
            Assert.DoesNotContain("CleArticle", q1);
        }

        [Theory]
        [InlineData("clearticle,foo(codarticle),libarticle")]
        [InlineData("clearticle,codarticle(txtarticle),libarticle")]
        public void ShouldNotHaveFieldWhenReferenceNotFound(string fields)
        {
            var parser = new FieldParser();
            parser.Load<Article>(fields);

            var lookup = parser.GetFields();

            var q1 = lookup.SelectMany(x => x);
            Assert.Contains("clearticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.DoesNotContain("codarticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.Contains("libarticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.DoesNotContain("txtarticle", q1, StringComparer.OrdinalIgnoreCase);
        }

        public void DoesNotAllow2LevelReference()
        {
        }

        public void ThrowArgumentExceptionIfMissingCloseParenthesis()
        {

        }
    }
}
