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

            if (parser.HasFieldsNotFound)
            {
                var fieldsNotFound = parser.GetFieldsNotFound();

                var q = from kvp in fieldsNotFound
                        let qf = kvp.Value.Select(f => "'" + f + "'")
                        select string.Format(ServiceErrorMessages.EntityFieldsNotFound, kvp.Key.Name, string.Join(", ", qf));

                throw new ArgumentException(
                            string.Format(ServiceErrorMessages.EntityFieldsNotFound, nameof(T), q.ToList()));
            }

            var fieldsByType = parser.GetFieldsByType();

            var fields0 = fieldsByType.Where(x => x.Key == typeof(T)).SelectMany(x => x.Value).ToArray();
            expression.Select(fields0);

            var result = dbConn.Select(expression);

            foreach (Type type in fieldsByType.Keys)
            {
                var fk = parser.GetForeignKeys()
                var fields1 = fieldsByType.Where(x => x.Key == type).SelectMany(x => x.Value).ToArray();

            }

            return result;
        }
    }
}
