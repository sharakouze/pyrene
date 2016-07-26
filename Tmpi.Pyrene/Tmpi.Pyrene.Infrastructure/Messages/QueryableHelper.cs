using System;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using System.Linq.Expressions;

namespace Tmpi.Pyrene.Infrastructure.Messages
{
    public static class QueryableHelper
    {
        public static IQueryable<T> ToPaging<T, TKey>(this IQueryable<T> source, IPaginableRequest request, 
            Expression<Func<T, TKey>> keySelector = null)
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

            if (request.Sort == null || !request.Sort.Any())
            {
                if (keySelector != null)
                {
                    source = source.OrderBy(keySelector); // Tri par défaut.
                }
            }
            else
            {
                foreach (string s in request.Sort)
                {
                    source = source.OrderBy(s);
                }
            }

            return source;
        }
    }
}
