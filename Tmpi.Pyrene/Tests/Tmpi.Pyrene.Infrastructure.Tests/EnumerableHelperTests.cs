using Microsoft.VisualStudio.TestTools.UnitTesting;
using Tmpi.Pyrene.Infrastructure.Messages;

namespace Tmpi.Pyrene.Infrastructure.Tests
{
    [TestClass]
    public class EnumerableHelperTests
    {
        [TestMethod]
        public void IsNullOrEmpty_NullInput_ShouldReturnTrue()
        {
            int[] src = null;
            bool b = EnumerableHelper.IsNullOrEmpty(src);

            Assert.IsTrue(b);
        }

        [TestMethod]
        public void IsNullOrEmpty_EmptyInput_ShouldReturnTrue()
        {
            var src = new int[] { };
            bool b = EnumerableHelper.IsNullOrEmpty(src);

            Assert.IsTrue(b);
        }

        [TestMethod]
        public void IsNullOrEmpty_ValidInput_ShouldReturnFalse()
        {
            var src1 = new string[] { null, "foo", "bar" };
            bool b1 = EnumerableHelper.IsNullOrEmpty(src1);

            var src2 = new int[] { 1, 2, 3, 4 };
            bool b2 = EnumerableHelper.IsNullOrEmpty(src2);

            Assert.IsFalse(b1);
            Assert.IsFalse(b2);
        }
    }
}
