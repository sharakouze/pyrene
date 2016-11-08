using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Tmpi.Pyrene.Common.OrmLite;
using Tmpi.Pyrene.Common.Tests.Shared;
using Xunit;

namespace Tmpi.Pyrene.Common.Tests
{
    public class FieldParserTest
    {
        [Theory]
        [InlineData("foo,clearticle,bar,fourn(plop)", typeof(Article),
            new[] { "foo", "bar" }, new[] { "plop" })]
        public void ShouldHaveErrorsWhenFieldNotFound(string inputFields, Type inputType,
            IEnumerable<string> expectedErrorsInBaseType, IEnumerable<string> expectedErrorsInOtherTypes)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            Assert.True(parser.HasErrors);

            var errors = parser.GetErrors();
            var q1 = errors.Where(x => x.Key == inputType).SelectMany(x => x.Value);
            var q2 = errors.Where(x => x.Key != inputType).SelectMany(x => x.Value);

            foreach (string field in expectedErrorsInBaseType)
            {
                Assert.Contains(field, q1, StringComparer.OrdinalIgnoreCase);
                Assert.DoesNotContain(field, q2, StringComparer.OrdinalIgnoreCase);
            }
            foreach (string field in expectedErrorsInOtherTypes)
            {
                Assert.Contains(field, q2, StringComparer.OrdinalIgnoreCase);
                Assert.DoesNotContain(field, q1, StringComparer.OrdinalIgnoreCase);
            }
        }

        /// <summary>
        /// Teste le cas particulier où le champ correspondant à la FK est introuvable.
        /// </summary>
        [Fact]
        public void ThrowExceptionIfForeignKeyFieldNotFound()
        {
            string fields = "CleArticle,MagasinSecondaire";

            var parser = new FieldParser();
            Assert.Throws<Exception>(() => parser.Load<Article>(fields));
        }

        /// <summary>
        /// Teste les références incorrectes et les références introuvables.
        /// </summary>
        [Theory]
        [InlineData("clearticle,foo(codarticle),libarticle", typeof(Article),
            new[] { "clearticle", "libarticle" }, new[] { "codarticle" })]
        [InlineData("clearticle,codarticle(txtarticle),libarticle", typeof(Article),
            new[] { "clearticle", "libarticle" }, new[] { "codarticle", "txtarticle" })]
        public void ShouldNotHaveFieldWhenReferenceNotFound(string inputFields, Type inputType,
            IEnumerable<string> expectedFields, IEnumerable<string> notExpectedFields)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            Assert.True(parser.HasErrors);

            var fieldsByType = parser.GetFieldsByType();
            var q = fieldsByType.SelectMany(x => x.Value);

            foreach (string field in expectedFields)
            {
                Assert.Contains(field, q, StringComparer.OrdinalIgnoreCase);
            }
            foreach (string field in notExpectedFields)
            {
                Assert.DoesNotContain(field, q, StringComparer.OrdinalIgnoreCase);
            }
        }

        /// <summary>
        /// Teste la présence de références imbriquées sur plus d'un niveau de profondeur.
        /// </summary>
        [Theory]
        [InlineData("clearticle,fourn(codarticle,pays)", typeof(Article))]
        [InlineData("clearticle,fourn(codarticle,pays(nompays))", typeof(Article))]
        public void ThrowArgumentExceptionIfMultiLevelReference(string inputFields, Type inputType)
        {
            var parser = new FieldParser();
            Assert.Throws<ArgumentException>(() => parser.Load(inputFields, inputType));
        }

        /// <summary>
        /// Teste les parenthèses en trop ou manquantes.
        /// </summary>
        [Theory]
        [InlineData("clearticle,fourn(clefourn,codfourn", typeof(Article))]
        [InlineData("clearticle,fourn(codfourn)),magasin", typeof(Article))]
        public void ThrowArgumentExceptionIfIncorrectParenthesis(string inputFields, Type inputType)
        {
            var parser = new FieldParser();
            Assert.Throws<ArgumentException>(() => parser.Load(inputFields, inputType));
        }

        /// <summary>
        /// Teste l'ajout automatique les champs associés aux références à charger.
        /// </summary>
        [Theory]
        [InlineData("codarticle,fournfabricant,magasin", typeof(Article),
            new[] { "clefournfabricant", "clemagasin" }, new[] { "clefournfabricant", "clemagasin" }, new[] { "clefourn" })]
        [InlineData("fourn(codfourn),magasin", typeof(Article),
            new string[] { }, new[] { "clefourn", "clemagasin" }, new[] { "clefourn", "clemagasin", "clefournfabricant" })]
        public void ShouldHaveForeignKeyField(string inputFields, Type inputType,
            IEnumerable<string> expectedFields, IEnumerable<string> expectedFKs, IEnumerable<string> notExpectedFields)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            var fieldsByType = parser.GetFieldsByType();
            var q1 = fieldsByType.SelectMany(x => x.Value);

            var fks = parser.GetForeignKeys();
            var q2 = fks.Select(x => x.Name);

            foreach (string field in expectedFields)
            {
                Assert.Contains(field, q1, StringComparer.OrdinalIgnoreCase);
            }
            foreach (string fk in expectedFKs)
            {
                Assert.Contains(fk, q2, StringComparer.OrdinalIgnoreCase);
            }
            foreach (string field in notExpectedFields)
            {
                Assert.DoesNotContain(field, q1, StringComparer.OrdinalIgnoreCase);
            }
        }

        [Fact]
        public void ShouldHaveAskedFields()
        {
            string fields = "codarticle, fourn ( codfourn , ),fournfabricant(), ,libarticle";

            var parser = new FieldParser();
            parser.Load<Article>(fields);

            Assert.False(parser.HasErrors);

            var fieldsByType = parser.GetFieldsByType();

            var q1 = fieldsByType.Where(x => x.Key == typeof(Article)).SelectMany(x => x.Value);
            Assert.Contains("CodArticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.Contains("LibArticle", q1, StringComparer.OrdinalIgnoreCase);

            var q2 = fieldsByType.Where(x => x.Key == typeof(Fourn)).SelectMany(x => x.Value);
            Assert.Contains("CodFourn", q2, StringComparer.OrdinalIgnoreCase);

            var q3 = fieldsByType.Select(x => x.Key);
            Assert.Contains(typeof(Article), q3);
            Assert.Contains(typeof(Fourn), q3);
            Assert.DoesNotContain(typeof(Magasin), q3);
        }

        /// <summary>
        /// Teste l'unicité des champs dans le résultat.
        /// </summary>
        [Theory]
        [InlineData("codarticle,clefourn,fourn(codfourn),fournfabricant(codfourn),codarticle", typeof(Article))]
        public void ShouldNotHaveDuplicateFieldsInResult(string inputFields, Type inputType)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            Assert.False(parser.HasErrors);

            var fieldsByType = parser.GetFieldsByType();
            foreach (var kvp in fieldsByType)
            {
                foreach (string field in kvp.Value)
                {
                    Assert.Single(kvp.Value, x => string.Equals(x, field, StringComparison.OrdinalIgnoreCase));
                }
            }
        }
    }
}
