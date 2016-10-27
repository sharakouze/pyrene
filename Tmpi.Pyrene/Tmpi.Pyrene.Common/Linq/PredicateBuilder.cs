using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Common.Linq
{
    public static class JoinPredicateBuilder
    {
        public static Expression<Func<T1, T2, bool>> Create<T1, T2>(Expression<Func<T1, T2, bool>> expr)
        {
            return expr;
        }

        public static Expression<Func<T1, T2, bool>> And<T1, T2>(this Expression<Func<T1, T2, bool>> left,
            Expression<Func<T1, T2, bool>> right)
        {
            return left.Compose(right, Expression.AndAlso);
            //var invokedExpr = Expression.Invoke(right, left.Parameters.Cast<Expression>());
            //return Expression.Lambda<Func<T1, T2, bool>>
            //      (Expression.AndAlso(left.Body, invokedExpr), left.Parameters);
        }

        private static Expression<T> Compose<T>(this Expression<T> first, Expression<T> second,
                                                        Func<Expression, Expression, Expression> merge)
        {
            // zip parameters (map from parameters of second to parameters of first)
            Dictionary<ParameterExpression, ParameterExpression> map = first.Parameters
                .Select((f, i) => new { f, s = second.Parameters[i] })
                .ToDictionary(p => p.s, p => p.f);

            // replace parameters in the second lambda expression with the parameters in the first
            Expression secondBody = ParameterRebinder.ReplaceParameters(map, second.Body);

            // create a merged lambda expression with parameters from the first expression
            return Expression.Lambda<T>(merge(first.Body, secondBody), first.Parameters);
        }
    }
}
