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

        private readonly Dictionary<Type, List<string>> _refsByType = new Dictionary<Type, List<string>>();
        private readonly Dictionary<string, List<string>> _fieldsByRef = new Dictionary<string, List<string>>();
        private readonly List<FieldDefinition> _foreignKeys = new List<FieldDefinition>();
        private readonly List<Tuple<Type, string>> _errors = new List<Tuple<Type, string>>();

        /// <summary>
        /// Supprime tous les éléments de <see cref="FieldParser"/>.
        /// </summary>
        public void Clear()
        {
            _refsByType.Clear();
            _fieldsByRef.Clear();
            _foreignKeys.Clear();
            _errors.Clear();
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
        /// Retourne les champs non trouvés.
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
        /// Retourne les champs trouvés.
        /// </summary>
        /// <returns>Nom des champs trouvés regroupés par type.</returns>
        public ILookup<Type, string> GetFieldsByType()
        {
            var q1 = from refByType in _refsByType
                     from refName in refByType.Value
                     join fieldByRef in _fieldsByRef on refName equals fieldByRef.Key
                     where !fieldByRef.Value.Any()
                     select refByType.Key;
            var lstTypeSelectAll = q1.Distinct();

            var q = from refByType in _refsByType
                    where !lstTypeSelectAll.Contains(refByType.Key)
                    from refName in refByType.Value
                    join fieldByRef in _fieldsByRef on refName equals fieldByRef.Key
                    from fieldName in fieldByRef.Value
                    select new
                    {
                        Key = refByType.Key,
                        Value = fieldName
                    };
            return q.Union(q1.Select(x => new { Key = x, Value = (string)null })).ToLookup(k => k.Key, v => v.Value);
        }

        private void AddResult(Type refType, string refField, string field = null)
        {
            List<string> lstRefFields;
            _refsByType.TryGetValue(refType, out lstRefFields);
            if (lstRefFields == null)
            {
                lstRefFields = new List<string>();
                _refsByType.Add(refType, lstRefFields);
            }
            if (!lstRefFields.Contains(refField, StringComparer.OrdinalIgnoreCase))
            {
                lstRefFields.Add(refField);
            }

            List<string> lstFields;
            _fieldsByRef.TryGetValue(refField, out lstFields);
            if (lstFields == null)
            {
                lstFields = new List<string>();
                _fieldsByRef.Add(refField, lstFields);
            }
            if (!string.IsNullOrEmpty(field) && !lstFields.Contains(field, StringComparer.OrdinalIgnoreCase))
            {
                lstFields.Add(field);
            }
        }

        /// <summary>
        /// Retourne les clés étrangères.
        /// </summary>
        /// <returns></returns>
        public IEnumerable<FieldDefinition> GetForeignKeys()
        {
            return _foreignKeys;
        }

        private void AddForeignKey(FieldDefinition fieldDef)
        {
            _foreignKeys.Add(fieldDef);
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
                        AddForeignKey(fkFieldDef);
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
            Load(fields, typeof(T));
        }
        public void Load(string fields, Type type)
        {
            Clear();

            var buffer = new StringBuilder();

            var tpl = Tuple.Create(type.GetModelMetadata(), string.Empty);
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
