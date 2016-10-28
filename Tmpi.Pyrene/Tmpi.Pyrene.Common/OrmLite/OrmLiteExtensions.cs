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
    public static class OrmLiteExtensions
    {
        public static ILookup<Type, string> ParseFields<T>(string fields)
        {
            //var modelDef = typeof(T).GetModelMetadata();
            //if (modelDef == null)
            //{
            //    return null;
            //}

            var result = new List<Tuple<Type, string>>();

            var field = new StringBuilder();

            //Type key = typeof(T);
            var modelDef = typeof(T).GetModelMetadata();
            if (modelDef == null)
            {
                return null;
            }

            List<string> notFound = new List<string>();


            for (int i = 0; i < fields.Length; i++)
            {
                char c = fields[i];

                if (c == '(' || c == ')' || c == ',')
                {
                    var fieldDef = modelDef.AllFieldDefinitionsArray
                        .FirstOrDefault(f => string.Equals(f.Name, field.ToString(), StringComparison.OrdinalIgnoreCase));
                    if (fieldDef == null)
                    {
                        notFound.Add(field.ToString());
                    }
                    else
                    {
                        if (fieldDef.IsReference)
                        {
                            modelDef = fieldDef.FieldType.GetModelMetadata();
                        }

                        result.Add(Tuple.Create(modelDef.ModelType, field.ToString()));

                        if (c == ')')
                        {
                            modelDef = typeof(T).GetModelMetadata();
                        }

                        //if (c == '(')
                        //{
                        //    key = fieldDef.FieldType;
                        //}
                    }
                    field.Clear();
                }
                else if (!char.IsWhiteSpace(c))
                {
                    field.Append(c);
                }

                /*                switch (c)
                                {
                                    case '(':
                                        var fieldDef = modelDef.AllFieldDefinitionsArray.FirstOrDefault(f => string.Equals(f.FieldName, field.ToString(), StringComparison.OrdinalIgnoreCase));
                                        if (fieldDef != null)
                                        {
                                            key = fieldDef.FieldType;
                                            field.Clear();
                                        }
                                        break;

                                    case ')':
                                    case ',':
                                        result.Add(Tuple.Create(key, field.ToString()));
                                        field.Clear();
                                        if (c == ')')
                                        {
                                            key = null;
                                        }
                                        break;


                                    default:
                                        if (!char.IsWhiteSpace(c))
                                        {
                                            field.Append(c);
                                        }
                                        break;
                                }
                                */
            }

            return result.ToLookup(k => k.Item1, v => v.Item2);
        }

        public static List<T> SelectPartial<T>(this IDbConnection dbConn, SqlExpression<T> expression, string fields)
        {
            var lookup = ParseFields<T>(fields);
            var f0 = lookup.Where(x => x.Key == null).SelectMany(x => x).ToArray();

            expression.Select(f0);

            var result = dbConn.Select(expression);


            return result;
        }
    }
}
