using System;
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
            // 'foo', 'bar' et 'plop' introuvables
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
        public void ThrowExceptionIfForeignKeyFieldNotFound()
        {
            // 'CleMagasinSecondaire' introuvable
            string fields = "CleArticle,MagasinSecondaire";

            var parser = new FieldParser();
            Assert.Throws<Exception>(() => parser.Load<Article>(fields));
        }

        [Theory]
        [InlineData("clearticle,foo(codarticle),libarticle")]
        [InlineData("clearticle,codarticle(txtarticle),libarticle")]
        public void ShouldNotHaveFieldWhenReferenceNotFound(string fields)
        {
            // Teste les références incorrectes et les références introuvables
            var parser = new FieldParser();
            parser.Load<Article>(fields);

            Assert.True(parser.HasErrors);

            var lookup = parser.GetFieldsByType();

            var q1 = lookup.SelectMany(x => x);
            Assert.Contains("clearticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.DoesNotContain("codarticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.Contains("libarticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.DoesNotContain("txtarticle", q1, StringComparer.OrdinalIgnoreCase);
        }

        [Theory]
        [InlineData("clearticle,fourn(codarticle,pays)")]
        [InlineData("clearticle,fourn(codarticle,pays(nompays))")]
        public void ThrowArgumentExceptionIfMultiLevelReference(string fields)
        {
            // Teste la présence de références imbriquées sur plus d'un niveau de profondeur
            var parser = new FieldParser();
            Assert.Throws<ArgumentException>(() => parser.Load<Article>(fields));
        }

        [Theory]
        [InlineData("clearticle,fourn(clefourn,codfourn")]
        [InlineData("clearticle,fourn(codfourn)),magasin")]
        public void ThrowArgumentExceptionIfIncorrectParenthesis(string fields)
        {
            // Teste les parenthèses en trop ou manquantes
            var parser = new FieldParser();
            Assert.Throws<ArgumentException>(() => parser.Load<Article>(fields));
        }

        [Fact]
        public void ShouldHaveForeignKeyField()
        {
            string fields = "codarticle,fourn";

            var parser = new FieldParser();
            parser.Load<Article>(fields);

            var lookup = parser.GetFieldsByType();

            var q1 = lookup.SelectMany(x => x);
            Assert.Contains("CleFourn", q1, StringComparer.OrdinalIgnoreCase);
        }

        [Fact]
        public void ShouldHaveAskedField()
        {
            string fields = "codarticle,fourn(codfourn,),,magasin";

            var parser = new FieldParser();
            parser.Load<Article>(fields);

            Assert.False(parser.HasErrors);

            var lookup = parser.GetFieldsByType();

            var q1 = lookup.SelectMany(x => x);
            Assert.Contains("CleFourn", q1, StringComparer.OrdinalIgnoreCase);
        }

        [Fact]
        public void ShouldNotHaveDuplicateFieldsInResult()
        {
            // 'CodArticle' et 'CodFourn' sont spécifiés en double. 'CleFourn' est aussi ajouté en temps que FK
            string fields = "codarticle,clefourn,fourn(codfourn),fournfabricant(codfourn),codarticle";

            var parser = new FieldParser();
            parser.Load<Article>(fields);

            Assert.False(parser.HasErrors);

            var lookup = parser.GetFieldsByType();

            var q1 = lookup.SelectMany(x => x);
            Assert.Single(q1, x => string.Equals(x, "codarticle", StringComparison.OrdinalIgnoreCase));
            Assert.Single(q1, x => string.Equals(x, "clefourn", StringComparison.OrdinalIgnoreCase));
            Assert.Single(q1, x => string.Equals(x, "codfourn", StringComparison.OrdinalIgnoreCase));
        }
    }
}
