using System;
using System.Collections.Generic;
using System.Data;
using ServiceStack.OrmLite;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceStack.Text;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public static class ReadApi
    {
        private static ILookup<string, string> ParseFields(string fields)
        {
            var result = new List<Tuple<string, string>>();

            var field = new StringBuilder();

            string entity = "";

            for (int i = 0; i < fields.Length; i++)
            {
                char c = fields[i];

                if (c == '(')
                {
                    entity = field.ToString();
                    field.Clear();
                }
                else if (c == ')')
                {
                    result.Add(Tuple.Create(entity, field.ToString()));
                }
                else if (c == ',')
                {
                    result.Add(Tuple.Create(entity, field.ToString()));
                    field.Clear();
                }
                else
                {
                    field.Append(c);
                }
            }

            return result.ToLookup(k => k.Item1, v => v.Item2);
        }

        public static List<T> SelectPartial<T>(this IDbConnection dbConn, string fields, int? skip, int? take)
        {
            var lookup = ParseFields(fields);
            var f0 = lookup.Where(x => x.Key == "").SelectMany(x => x).ToArray();

            var q = dbConn.From<T>()
                .Limit(skip, take)
                .Select(f0);

            var result = dbConn.Select(q);

            return result;
        }
    }
}
