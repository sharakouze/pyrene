using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public class FieldParser
    {
        public static string ForeignKeyFormat = "Cle{0}";

        private readonly List<Tuple<string, Type, string>> _results = new List<Tuple<string, Type, string>>();
        private readonly List<Tuple<Type, string>> _errors = new List<Tuple<Type, string>>();
        private readonly List<Tuple<Type, FieldDefinition>> _foreignKeys = new List<Tuple<Type, FieldDefinition>>();

        /// <summary>
        /// Supprime tous les éléments de <see cref="FieldParser"/>.
        /// </summary>
        public void Clear()
        {
            _results.Clear();
            _errors.Clear();
            _foreignKeys.Clear();
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

        public ILookup<Type, string> GetFields()
        {
            return _results.ToLookup(k => k.Item2, v => v.Item3);
        }

        private void AddResult(string refField, Type refType, string field = null)
        {
            _results.Add(Tuple.Create(refField, refType, field));
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


        private FieldDefinition ParseField(StringBuilder buffer, Tuple<string, ModelDefinition> tpl,
            bool forceReference = false)
        {
            if (buffer.Length > 0)
            {
                string field = buffer.ToString();
                buffer.Clear();

                var fieldDef = tpl.Item2.AllFieldDefinitionsArray
                    .FirstOrDefault(f => string.Equals(f.Name, field, StringComparison.OrdinalIgnoreCase));
                if (fieldDef == null)
                {
                    AddError(tpl.Item2.ModelType, field);
                }
                else if (fieldDef.IsReference)
                {
                    if (!string.IsNullOrEmpty(tpl.Item1))
                    {
                        throw new ArgumentException();
                    }
                    //                    var fkField = GetForeignKeyField(modelDef, fieldDef);
                    //                    if (fkField == null)
                    //                    {
                    //                        AddError(modelDef.ModelType, field);
                    //                    }
                    //                    else
                    //                    {
                    //                        _foreignKeys.Add(Tuple.Create(lastRefModelDef.ModelType, fkField));
                    //                    }

                    AddResult(fieldDef.Name, fieldDef.FieldType);
                }
                else if (!forceReference)
                {
                    AddResult(tpl.Item1, tpl.Item2.ModelType, fieldDef.Name);
                }

                return fieldDef;
            }

            return null;
        }

        public void Load<T>(string fields)
        {
            Clear();

            var buffer = new StringBuilder();

            var tpl = Tuple.Create(string.Empty, typeof(T).GetModelMetadata());
            AddResult(tpl.Item1, tpl.Item2.ModelType);

            var stack = new Stack<Tuple<string, ModelDefinition>>();
            stack.Push(tpl);

            for (int i = 0; i < fields.Length; i++)
            {
                char c = fields[i];

                if (c == ',')
                {
                    ParseField(buffer, stack.Peek());
                }
                else if (c == '(')
                {
                    var fieldDef = ParseField(buffer, stack.Peek(), true);

                    if (fieldDef == null || !fieldDef.IsReference)
                    {
                        int index = fields.IndexOf(')', i);
                        if (index == -1)
                        {
                            throw new ArgumentException("Parenthèse fermante attendue dans : '{0}'", fields);
                        }

                        i = index + 1; // on saute tout le contenu de la parenthèse non valable
                    }
                    else
                    {
                        stack.Push(Tuple.Create(fieldDef.Name, fieldDef.FieldType.GetModelMetadata()));
                    }
                }
                else if (c == ')')
                {
                    ParseField(buffer, stack.Pop());
                }
                else if (c != ' ')
                {
                    buffer.Append(c);
                }
            }

            ParseField(buffer, stack.Peek());
        }
    }
}
