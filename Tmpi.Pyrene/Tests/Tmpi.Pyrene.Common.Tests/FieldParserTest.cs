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
        /// <summary>
        /// Teste les champs non trouvés.
        /// </summary>
        [Fact]
        public void Should_Have_FieldsNotFound_When_Incorrect_Input()
        {
            string inputFields = "foo,clearticle,bar,fourn(plop),magasin(test)";

            var parser = new FieldParser();
            parser.Load<Article>(inputFields);

            Assert.True(parser.HasFieldsNotFound);

            var fieldsNotFound = parser.GetFieldsNotFound();

            var q1 = fieldsNotFound.Where(x => x.Key == typeof(Article)).SelectMany(x => x.Value);
            Assert.Contains("foo", q1, StringComparer.OrdinalIgnoreCase);
            Assert.Contains("bar", q1, StringComparer.OrdinalIgnoreCase);
            Assert.DoesNotContain("clearticle", q1, StringComparer.OrdinalIgnoreCase);

            var q2 = fieldsNotFound.Where(x => x.Key == typeof(Fourn)).SelectMany(x => x.Value);
            Assert.Contains("plop", q2, StringComparer.OrdinalIgnoreCase);

            var q3 = fieldsNotFound.Where(x => x.Key == typeof(Magasin)).SelectMany(x => x.Value);
            Assert.Contains("test", q3, StringComparer.OrdinalIgnoreCase);
        }

        /// <summary>
        /// Teste le cas particulier où le champ/clé correspondant à la FK est introuvable.
        /// </summary>
        [Fact]
        public void Throw_Exception_If_ForeignKey_Field_Not_Found()
        {
            string inputFields = "CleArticle,MagasinSecondaire";

            var parser = new FieldParser();
            Assert.Throws<Exception>(() => parser.Load<Article>(inputFields));
        }

        /// <summary>
        /// Teste le chargement des références introuvables.
        /// </summary>
        [Theory]
        [InlineData("clearticle,foo(codarticle),libarticle", typeof(Article),
            new[] { "clearticle", "libarticle" }, new[] { "foo", "codarticle" })]
        public void Should_Not_Load_Fields_When_Reference_Not_Found(string inputFields, Type inputType,
            IEnumerable<string> expectedFields, IEnumerable<string> notExpectedFields)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            Assert.True(parser.HasFieldsNotFound);

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
        /// Teste le cas où une référence demandée n'est pas marquée avec l'attribut [Reference]
        /// </summary>
        [Fact]
        public void Throw_ArgumentException_If_Reference_Is_Simple_Field()
        {
            string inputFields = "clearticle,codarticle(txtarticle),libarticle";

            var parser = new FieldParser();
            Assert.Throws<ArgumentException>(() => parser.Load<Article>(inputFields));
        }

        /// <summary>
        /// Teste la présence de références imbriquées sur plus d'un niveau de profondeur.
        /// </summary>
        [Theory]
        [InlineData("clearticle,fourn(codarticle,pays)", typeof(Article))]
        [InlineData("clearticle,fourn(codarticle,pays(nompays))", typeof(Article))]
        public void Throw_ArgumentException_If_MultiLevel_Reference(string inputFields, Type inputType)
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
        public void Throw_ArgumentException_If_Incorrect_Parenthesis(string inputFields, Type inputType)
        {
            var parser = new FieldParser();
            Assert.Throws<ArgumentException>(() => parser.Load(inputFields, inputType));
        }

        /// <summary>
        /// Teste l'ajout automatique des champs/clés associés aux références à charger.
        /// </summary>
        [Theory]
        [InlineData("codarticle,fournfabricant,magasin", typeof(Article),
            new[] { "clefournfabricant", "clemagasin" }, new[] { "clefournfabricant", "clemagasin" }, new[] { "clefourn" })]
        [InlineData("fourn(codfourn),magasin", typeof(Article),
            new string[] { }, new[] { "clefourn", "clemagasin" }, new[] { "clefourn", "clemagasin", "clefournfabricant" })]
        public void Should_Have_ForeignKey_Field_For_Each_Reference(string inputFields, Type inputType,
            IEnumerable<string> expectedFields, IEnumerable<string> expectedFKs, IEnumerable<string> notExpectedFields)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            var fieldsByType = parser.GetFieldsByType();
            var q1 = fieldsByType.SelectMany(x => x.Value);

            var fks = parser.GetForeignKeyFields();
            var q2 = fks.SelectMany(x => x.Value).Select(x => x.Name);

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

        /// <summary>
        /// Teste le fonctionnement avec une expression valide.
        /// </summary>
        [Fact]
        public void Should_Have_Asked_Fields_When_Valid_Input()
        {
            string inputFields = "codarticle, fourn ( codfourn , ),fournfabricant(LIBFOURN), ,libarticle";

            var parser = new FieldParser();
            parser.Load<Article>(inputFields);

            Assert.False(parser.HasFieldsNotFound);

            var fieldsByType = parser.GetFieldsByType();

            var q1 = fieldsByType.Where(x => x.Key == typeof(Article)).SelectMany(x => x.Value);
            Assert.Contains("CodArticle", q1, StringComparer.OrdinalIgnoreCase);
            Assert.Contains("LibArticle", q1, StringComparer.OrdinalIgnoreCase);

            var q2 = fieldsByType.Where(x => x.Key == typeof(Fourn)).SelectMany(x => x.Value);
            Assert.Contains("CodFourn", q2, StringComparer.OrdinalIgnoreCase);
            Assert.Contains("LibFourn", q2, StringComparer.OrdinalIgnoreCase);

            var q3 = fieldsByType.Select(x => x.Key);
            Assert.Contains(typeof(Article), q3);
            Assert.Contains(typeof(Fourn), q3);
            Assert.DoesNotContain(typeof(Magasin), q3);
        }

        /// <summary>
        /// Teste l'unicité des définitions de FK.
        /// </summary>
        [Theory]
        [InlineData("clefourn,fourn,fourn(),fournfabricant(clefourn),fournfabricant", typeof(Article))]
        public void Should_Not_Have_Duplicate_ForeignKey_Definitions(string inputFields, Type inputType)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            var fks = parser.GetForeignKeyFields();
            var q = fks.SelectMany(x => x.Value).Select(x => x.Name);

            foreach (string field in q)
            {
                Assert.Single(q, x => string.Equals(x, field, StringComparison.OrdinalIgnoreCase));
            }
        }

        /// <summary>
        /// Teste l'unicité des champs dans le résultat.
        /// </summary>
        [Theory]
        [InlineData("codarticle,clefourn,fourn(codfourn),fournfabricant(codfourn),codarticle", typeof(Article))]
        public void Should_Not_Have_Duplicate_Fields_In_Result(string inputFields, Type inputType)
        {
            var parser = new FieldParser();
            parser.Load(inputFields, inputType);

            Assert.False(parser.HasFieldsNotFound);

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
