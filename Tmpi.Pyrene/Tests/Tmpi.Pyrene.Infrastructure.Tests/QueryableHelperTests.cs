using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Tmpi.Pyrene.Infrastructure.Messages;

namespace Tmpi.Pyrene.Infrastructure.Tests
{
    [TestClass]
    public class QueryableHelperTests
    {
        public class PaginableRequest : IPaginableRequest
        {
            public int Skip { get; set; }
            public string[] Sort { get; set; }
            public int Take { get; set; }
        }

        [TestMethod]
        public void Paging_EmptyRequest_ShouldDoNothing()
        {
            var request = new PaginableRequest()
            {
                Skip = 0,
                Take = 0,
                Sort = null
            };

            var src = new int[] { 2, 1, 3, 5, 4 };
            var result = QueryableHelper.Paging(src.AsQueryable(), request);

            Assert.AreEqual(src.Count(), result.Count());
            Assert.AreEqual(src.First(), result.First());
            Assert.AreEqual(src.Last(), result.Last());
        }

        [TestMethod]
        public void Paging_Skip1Take2_ShouldReturnValidResult()
        {
            var request = new PaginableRequest()
            {
                Skip = 1,
                Take = 2,
                Sort = null
            };

            var src = new int[] { 2, 1, 3, 5, 4 };
            var result = QueryableHelper.Paging(src.AsQueryable(), request);
            var lst = result.ToList();

            Assert.AreEqual(2, lst.Count);
            Assert.AreEqual(1, lst[0]);
            Assert.AreEqual(3, lst[1]);
        }

        [TestMethod]
        public void Paging_SkipMoreThanInputLength_ShouldReturnEmptyResult()
        {
            var request = new PaginableRequest()
            {
                Skip = 10,
                Take = 10,
                Sort = null
            };

            var src = new int[] { 2, 1, 3, 5, 4 };
            var result = QueryableHelper.Paging(src.AsQueryable(), request);

            Assert.IsFalse(result.Any());
        }

        [TestMethod]
        public void Paging_SimpleSortRequest_ShouldReturnSortedResult()
        {
            var request = new PaginableRequest()
            {
                Skip = 0,
                Take = 0,
                Sort = new[] { "P1" }
            };

            var src = "nicolas".Select(c => new { P1 = c.ToString() });
            var result = QueryableHelper.Paging(src.AsQueryable(), request);

            Assert.AreEqual(src.Count(), result.Count());
            Assert.AreEqual("a", result.First().P1);
            Assert.AreEqual("s", result.Last().P1);
        }

        [TestMethod]
        public void Paging_MultipleSortRequest_ShouldReturnSortedResult()
        {
            var request = new PaginableRequest()
            {
                Skip = 0,
                Take = 0,
                Sort = new[] { "P1", "P2 desc" }
            };

            var src = new[]
            {
                new { P1 = "z", P2 = 0 },
                new { P1 = "a", P2 = 5 },
                new { P1 = "x", P2 = 1 },
                new { P1 = "a", P2 = 9 },
                new { P1 = "a", P2 = 1 },
            };
            var result = QueryableHelper.Paging(src.AsQueryable(), request);

            Assert.AreEqual(src.Count(), result.Count());
            Assert.AreEqual("a", result.First().P1);
            Assert.AreEqual(9, result.First().P2);
            Assert.AreEqual("z", result.Last().P1);
        }
    }
}
