using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using ServiceStack.OrmLite;

using System.Text;
using System.Threading.Tasks;
using ServiceStack.Text;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public static class OrmLiteExtensions
    {
        public static List<T> SelectPartial<T>(this IDbConnection dbConn, SqlExpression<T> expression, string fields)
        {
            var parser = new FieldParser();
            parser.Load<T>(fields);

            if (parser.HasErrors)
            {
                var errors = parser.GetErrors();

                var q = from err in errors
                        let field = err.Select(f => "'" + f + "'")
                        select string.Format(ServiceErrorMessages.EntityFieldsNotFound, err.Key.Name, string.Join(", ", field));

                throw new ArgumentException(
                            string.Format(ServiceErrorMessages.EntityFieldsNotFound, nameof(T), q.ToList()));
            }

            //var lookup = ParseFields<T>(fields);
            //var f0 = lookup.Where(x => x.Key == null).SelectMany(x => x).ToArray();

            //expression.Select(f0);

            var result = dbConn.Select(expression);

            //foreach (Type type in lookup.Select(x => x.Key))
            //{


            //}

            return result;
        }
    }
}
