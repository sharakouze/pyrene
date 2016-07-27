using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;

namespace Tmpi.Pyrene.Infrastructure.Messages
{
    /// <summary>
    /// Fournit des méthodes statiques permettant de manipuler des <see cref="IQueryable"/>.
    /// </summary>
    public static class QueryableHelper
    {
        /// <summary>
        /// blablabla dans une séquence.
        /// </summary>
        /// <typeparam name="T">Type des éléments de <paramref name="source"/>.</typeparam>
        /// <param name="source"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        public static IQueryable<T> Pagination<T>(IQueryable<T> source, IPaginableRequest request)
        {
            Debug.Assert(source != null);
            Debug.Assert(request != null);

            if (request.Skip > 0)
            {
                source = source.Skip(request.Skip);
            }
            if (request.Take > 0)
            {
                source = source.Take(request.Take);
            }

            if (request.Sort != null)
            {
                foreach (string sort in request.Sort)
                {
                    source = source.OrderBy(sort);
                }
            }

            return source;
        }
    }
}
