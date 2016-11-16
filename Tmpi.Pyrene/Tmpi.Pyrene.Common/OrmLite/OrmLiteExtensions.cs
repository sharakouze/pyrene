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
            Type type = typeof(T);

            var parser = new FieldParser();
            parser.Load(fields, type);

            if (parser.HasFieldsNotFound)
            {
                var fieldsNotFound = parser.GetFieldsNotFound();

                var q = from kvp in fieldsNotFound
                        let qf = kvp.Value.Select(f => "'" + f + "'")
                        let str = string.Join(", ", qf)
                        select string.Format(ServiceErrorMessages.EntityFieldsNotFound, kvp.Key.Name, str);
                string message = string.Join(Environment.NewLine, q);

                throw new ArgumentException(message);
            }

            var fieldsByType = parser.GetFieldsByType();

            var fields0 = fieldsByType.Where(x => x.Key == type).SelectMany(x => x.Value).Select(x => x.Name).ToArray();
            expression.Select(fields0);

            var result = dbConn.Select(expression);

            var fks = parser.GetForeignKeyFields();
            var types = fieldsByType.Where(x => x.Key != type).Select(x => x.Key);
            foreach (Type refType in types)
            {
                List<object> lst = new List<object>();

                var fieldDefs = fks.Where(x => x.Key == refType).SelectMany(x => x.Value);
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

                var fields1 = fieldsByType.Where(x => x.Key == refType)
                    .SelectMany(x => x.Value)
                    .Select(x => x.GetQuotedName(null));

                var modelDef = refType.GetModelMetadata();

                StringBuilder sql = new StringBuilder();
                sql.AppendFormat("SELECT {0}", string.Join(",", fields1));
                sql.AppendFormat("FROM {0}", modelDef.Name);
                sql.AppendFormat("WHERE {0} IN ({1})", modelDef.PrimaryKey.GetQuotedName(null), null);
            }

            return result;
        }
    }
}
