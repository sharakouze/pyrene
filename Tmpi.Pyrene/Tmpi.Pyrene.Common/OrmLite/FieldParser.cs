using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public class FieldParser
    {
        public static string ForeignKeyFormat = "Cle{0}";

        private readonly List<Tuple<Type, string>> _errors = new List<Tuple<Type, string>>();

        private readonly List<Tuple<Type, string>> _results = new List<Tuple<Type, string>>();

        private readonly List<Tuple<Type, FieldDefinition>> _foreignKeys = new List<Tuple<Type, FieldDefinition>>();

        public ILookup<Type, string> GetFields()
        {
            return _results.ToLookup(k => k.Item1, v => v.Item2);
        }

        private void AddResult(Type type, string field = null)
        {
            _results.Add(Tuple.Create(type, field));
        }

        /// <summary>
        /// Obtient une valeur indiquant s'il existe des erreurs.
        /// </summary>
        public bool HasErrors
        {
            get
            {
                return _errors.Any();
            }
        }

        /// <summary>
        /// Obtient les noms des champs non trouvés regroupés par type.
        /// </summary>
        /// <returns></returns>
        public ILookup<Type, string> GetErrors()
        {
            return _errors.ToLookup(k => k.Item1, v => v.Item2);
        }

        private void AddError(Type type, string field)
        {
            _errors.Add(Tuple.Create(type, field));
        }

        private FieldDefinition GetForeignKeyField(ModelDefinition modelDef, FieldDefinition field)
        {
            if (field.IsReference)
            {
                string match = string.Format(ForeignKeyFormat, field.Name);
                return modelDef.FieldDefinitions.SingleOrDefault(f => f.Name == match);
            }

            return null;
        }

        /// <summary>
        /// Supprime tous les éléments de <see cref="FieldParser"/>.
        /// </summary>
        public void Clear()
        {
            _errors.Clear();
            _results.Clear();
        }

        public void Load<T>(string fields)
        {
            Clear();

            var modelDef = typeof(T).GetModelMetadata();
            var lastRefModelDef = modelDef;

            AddResult(modelDef.ModelType);

            char[] specialChars = new[] { ',', '(', ')', ' ' };
            int startIndex = 0;

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

                if ((field != string.Empty) && (modelDef != null))
                {
                    var fieldDef = modelDef.AllFieldDefinitionsArray
                        .FirstOrDefault(f => string.Equals(f.Name, field, StringComparison.OrdinalIgnoreCase));
                    if (fieldDef == null)
                    {
                        AddError(modelDef.ModelType, field);
                        lastRefModelDef = null;
                    }
                    else
                    {
                        if (fieldDef.IsReference)
                        {
                            lastRefModelDef = fieldDef.FieldType.GetModelMetadata();

                            AddResult(lastRefModelDef.ModelType);

                            var fkField = GetForeignKeyField(modelDef, fieldDef);
                            if (fkField == null)
                            {
                                AddError(modelDef.ModelType, field);
                            }
                            else
                            {
                                _foreignKeys.Add(Tuple.Create(lastRefModelDef.ModelType, fkField));
                            }
                        }
                        else
                        {
                            AddResult(modelDef.ModelType, fieldDef.Name);
                        }
                    }
                }

                if (c == '(')
                {
                    modelDef = lastRefModelDef;
                }
                else if (c == ')')
                {
                    modelDef = typeof(T).GetModelMetadata();
                }
            }
            while (index >= 0);
        }
    }
}
