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
            Type t = typeof(T);
            var parser = new FieldParser();
            parser.Load(fields, t);

            if (parser.HasFieldsNotFound)
            {
                var fieldsNotFound = parser.GetFieldsNotFound();

                var q = from kvp in fieldsNotFound
                        let qf = kvp.Value.Select(f => "'" + f + "'")
                        select string.Format(ServiceErrorMessages.EntityFieldsNotFound, kvp.Key.Name, string.Join(", ", qf));

                throw new ArgumentException();
            }

            var fieldsByType = parser.GetFieldsByType();

            var fields0 = fieldsByType.Where(x => x.Key == t).SelectMany(x => x.Value).ToArray();
            expression.Select(fields0);

            var result = dbConn.Select(expression);

            var fks = parser.GetForeignKeyFields();
            var types = fieldsByType.Where(x => x.Key != t).Select(x => x.Key);
            foreach (Type type in types)
            {
                List<object> lst = new List<object>();

                var fieldDefs = fks.Where(x => x.Key == type).SelectMany(x => x.Value);
                foreach (var fieldDef in fieldDefs)
                {
                    foreach (var row in result)
                    {
                        object value = fieldDef.GetValue(row);//GetQuotedValue ??
                        if (value != null)
                        {
                            lst.Add(value);
                        }
                    }
                }


                var fields1 = fieldsByType.Where(x => x.Key == type).SelectMany(x => x.Value).ToArray();

                var obj = dbConn.Select<T>()

            }

            return result;
        }
    }
}
