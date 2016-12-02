using Xunit;

namespace Tmpi.Pyrene.Common.Tests
{
    public class StringExtensionsTest
    {
        #region SplitWithQualifier
        [Fact]
        public void SplitWithQualifier_ShouldSplit_WithSameStartEndQualifier()
        {
            string input = "orangina fanta 'coca cola' pepsi";
            char[] separators = new[] { ' ' };
            char qualifier = '\'';
            char escapeChar = '\\';

            var result = StringExtensions.SplitWithQualifier(input, separators, qualifier, qualifier, escapeChar);

            Assert.Equal("orangina", result[0]);
            Assert.Equal("fanta", result[1]);
            Assert.Equal("coca cola", result[2]);
            Assert.Equal("pepsi", result[3]);
        }

        [Fact]
        public void SplitWithQualifier_ShouldSplit_WithEscapedInput()
        {
            string input = "cinq-cent-quarante-huit";
            char[] separators = new[] { '-' };
            char qualifier = '\'';
            char escapeChar = '\\';

            var result = StringExtensions.SplitWithQualifier(input, separators, qualifier, qualifier, escapeChar);

            Assert.Equal("un", result[0]);
            Assert.Equal("quarante-huit", result[1]);
            Assert.Equal("douze", result[2]);
        }
        #endregion
    }
}
