using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public class FieldParser
    {
        private List<Tuple<Type, string>> _result = new List<Tuple<Type, string>>();

        public ILookup<Type, string> Parse<T>(string fields)
        {
            var baseModelDef = typeof(T).GetModelMetadata();
            if (baseModelDef == null)
            {
                return null;
            }

            var buffer = new StringBuilder();
            var modelDef = baseModelDef;

            int startIndex = 0;
            int index;
            do
            {
                index = fields.IndexOfAny(new[] { ',', '(', ')', ' ' }, startIndex);
                string field;
                if (index == -1)
                {
                    field = fields.Substring(startIndex);
                }
                else
                {
                    field = fields.Substring(startIndex, index - startIndex);
                    startIndex = index + 1;
                }
            }
            while (index >= 0);


            for (int i = 0; i < fields.Length; i++)
            {
                char c = fields[i];

                if (c == ',' || c == '(' || c == ')' || i == fields.Length)
                {
                    if (buffer.Length == 0)
                    {
                        continue;
                    }

                    var fieldDef = modelDef.AllFieldDefinitionsArray
                        .FirstOrDefault(f => string.Equals(f.Name, buffer.ToString(), StringComparison.OrdinalIgnoreCase));
                    if (fieldDef == null)
                    {

                    }
                    else if (fieldDef.IsReference)
                    {
                        var refModelDef = fieldDef.FieldType.GetModelMetadata();
                        _result.Add(Tuple.Create(refModelDef.ModelType, ""));

                        if (c == '(')
                        {
                            modelDef = refModelDef;
                        }
                    }
                    else
                    {
                        _result.Add(Tuple.Create(modelDef.ModelType, fieldDef.Name));

                        if (c == ')')
                        {
                            modelDef = baseModelDef;
                        }
                    }

                    buffer.Clear();
                }
                else if (!char.IsWhiteSpace(c))
                {
                    buffer.Append(c);
                }
            }

            return null;
        }
    }
}
