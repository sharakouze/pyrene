using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public class FieldParser
    {
        private List<Tuple<Type, string>> _result = new List<Tuple<Type, string>>();

        public ILookup<Type, string> Parse<T>(string fields)
        {
            var modelDef = typeof(T).GetModelMetadata();

            char[] specialChars = new[] { ',', '(', ')', ' ' };
            int startIndex = 0;
            ModelDefinition refModelDef = null;

            int index;
            do
            {
                index = fields.IndexOfAny(specialChars, startIndex);

                char c = char.MinValue;
                int length;
                if (index == -1)
                {
                    length = fields.Length - startIndex;
                }
                else
                {
                    c = fields[index];
                    length = index - startIndex;
                }

                string field = fields.Substring(startIndex, length);
                startIndex = index + 1;

                if (field != string.Empty)
                {
                    var fieldDef = modelDef.AllFieldDefinitionsArray
                        .FirstOrDefault(f => string.Equals(f.Name, field, StringComparison.OrdinalIgnoreCase));
                    if (fieldDef == null)
                    {

                    }
                    else
                    {
                        if (fieldDef.IsReference)
                        {
                            refModelDef = fieldDef.FieldType.GetModelMetadata();
                            _result.Add(Tuple.Create(refModelDef.ModelType, ""));
                        }
                        else
                        {
                            _result.Add(Tuple.Create(modelDef.ModelType, fieldDef.Name));
                        }
                    }
                }

                if (c == '(')
                {
                    modelDef = refModelDef;
                }
                else if (c == ')')
                {
                    modelDef = typeof(T).GetModelMetadata();
                }
            }
            while (index >= 0);

            return _result.ToLookup(k => k.Item1, v => v.Item2);
        }
    }
}
