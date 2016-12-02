using System.Text;
using Tmpi.Pyrene.Common.Text;
using Xunit;

namespace Tmpi.Pyrene.Common.Tests
{
    public class StringBuilderExtensionsTest
    {
        [Fact]
        public void TrimEnd_Should_Trim()
        {
            var sb1 = new StringBuilder("nicolas ");
            sb1.TrimEnd();

            Assert.Equal("nicolas", sb1.ToString());
        }

        [Fact]
        public void TrimEnd_Should_Return_Same_Instance()
        {
            var sb1 = new StringBuilder("nicolas ");
            var sb2 = sb1.TrimEnd();

            Assert.Equal(sb1, sb2);
        }

        [Fact]
        public void TrimEnd_Should_2()
        {
            var sb1 = new StringBuilder("nicolas ");
            sb1.TrimEnd().Append(" boix");

            Assert.Equal("nicolas boix", sb1.ToString());
        }
    }
}
