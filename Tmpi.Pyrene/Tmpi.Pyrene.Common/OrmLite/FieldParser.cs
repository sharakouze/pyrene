using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public class FieldParser
    {
        public static string ForeignKeyFieldFormat = "Cle{0}";

        private readonly List<Tuple<Type, string, string>> _results = new List<Tuple<Type, string, string>>();
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
        /// Obtient les champs non trouvés.
        /// </summary>
        /// <returns>Nom des champs non trouvés regroupés par type.</returns>
        public ILookup<Type, string> GetErrors()
        {
            return _errors.ToLookup(k => k.Item1, v => v.Item2);
        }

        private void AddError(Type type, string field)
        {
            _errors.Add(Tuple.Create(type, field));
        }

        /// <summary>
        /// Obtient les champs trouvés.
        /// </summary>
        /// <returns>Nom des champs trouvés regroupés par type.</returns>
        public ILookup<Type, string> GetFieldsByType()
        {
            return _results.Select(x => new { x.Item1, x.Item3 })
                .Distinct()
                .ToLookup(k => k.Item1, v => v.Item3);
        }

        private void AddResult(Type refType, string refField, string field = null)
        {
            _results.Add(Tuple.Create(refType, refField, field));
        }

        private void AddForeignKey(Type type, FieldDefinition field)
        {
            _foreignKeys.Add(Tuple.Create(type, field));
        }

        private FieldDefinition ParseField(StringBuilder buffer, Tuple<ModelDefinition, string> tpl,
            bool forceReference = false)
        {
            if (buffer.Length > 0)
            {
                string field = buffer.ToString();
                buffer.Clear();

                var fieldDef = tpl.Item1.AllFieldDefinitionsArray
                    .FirstOrDefault(f => string.Equals(f.Name, field, StringComparison.OrdinalIgnoreCase));
                if (fieldDef == null)
                {
                    AddError(tpl.Item1.ModelType, field);
                }
                else if (fieldDef.IsReference)
                {
                    if (!string.IsNullOrEmpty(tpl.Item2))
                    {
                        throw new ArgumentException();
                    }

                    string fkFieldName = string.Format(ForeignKeyFieldFormat, fieldDef.Name);
                    var fkFieldDef = tpl.Item1.FieldDefinitions
                        .FirstOrDefault(f => string.Equals(f.Name, fkFieldName, StringComparison.OrdinalIgnoreCase));
                    if (fkFieldDef == null)
                    {
                        throw new Exception(
                            string.Format("Impossible de trouver un champ '{0}' associé à '{1}.{2}'", fkFieldName, tpl.Item1.Name, fieldDef.Name));
                    }
                    else
                    {
                        AddForeignKey(tpl.Item1.ModelType, fkFieldDef);
                        AddResult(tpl.Item1.ModelType, tpl.Item2, fkFieldDef.Name);

                        AddResult(fieldDef.FieldType, fieldDef.Name);
                    }
                }
                else if (forceReference)
                {
                    AddError(tpl.Item1.ModelType, field);
                }
                else
                {
                    AddResult(tpl.Item1.ModelType, tpl.Item2, fieldDef.Name);
                }

                return fieldDef;
            }

            return null;
        }

        /// <summary>
        /// Analyse la chaîne spécifiée.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="fields">Expression à analyser.</param>
        public void Load<T>(string fields)
        {
            Clear();

            var buffer = new StringBuilder();

            var tpl = Tuple.Create(typeof(T).GetModelMetadata(), string.Empty);
            AddResult(tpl.Item1.ModelType, tpl.Item2);

            var stack = new Stack<Tuple<ModelDefinition, string>>();
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
                    int index = fields.IndexOf(')', i);
                    if (index == -1)
                    {
                        throw new ArgumentException(
                            string.Format("Parenthèse fermante attendue dans : '{0}'", fields));
                    }

                    var fieldDef = ParseField(buffer, stack.Peek(), true);

                    if (fieldDef == null || !fieldDef.IsReference)
                    {
                        i = index + 1; // on saute tout le contenu de la parenthèse non valable
                    }
                    else
                    {
                        stack.Push(Tuple.Create(fieldDef.FieldType.GetModelMetadata(), fieldDef.Name));
                    }
                }
                else if (c == ')')
                {
                    if (stack.Count == 1)
                    {
                        throw new ArgumentException(
                            string.Format("Trop de parenthèses fermantes dans : '{0}'", fields));
                    }
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
