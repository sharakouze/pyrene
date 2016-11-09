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
        private readonly Dictionary<Type, List<FieldDefinition>> _foreignKeyFields = new Dictionary<Type, List<FieldDefinition>>();
        private readonly Dictionary<Type, List<string>> _errors = new Dictionary<Type, List<string>>();

        /// <summary>
        /// Supprime tous les éléments de <see cref="FieldParser"/>.
        /// </summary>
        private void Clear()
        {
            _refsByType.Clear();
            _fieldsByRef.Clear();
            _foreignKeyFields.Clear();
            _errors.Clear();
        }

        /// <summary>
        /// Obtient une valeur indiquant si l'analyse a généré des erreurs de champs non trouvés.
        /// </summary>
        public bool HasFieldsNotFound
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
        public IDictionary<Type, List<string>> GetFieldsNotFound()
        {
            return _errors;
        }

        private void AddError(Type type, string field)
        {
            List<string> lstErrors;
            _errors.TryGetValue(type, out lstErrors);
            if (lstErrors == null)
            {
                lstErrors = new List<string>();
                _errors.Add(type, lstErrors);
            }
            if (!lstErrors.Contains(field, StringComparer.OrdinalIgnoreCase))
            {
                lstErrors.Add(field);
            }
        }

        /// <summary>
        /// Retourne le résultat de l'analyse des champs trouvés.
        /// </summary>
        /// <returns>Nom des champs trouvés regroupés par type.</returns>
        public IDictionary<Type, string[]> GetFieldsByType()
        {
            // types pour lesquels on fera un select *
            var q1 = from refByType in _refsByType
                     from refName in refByType.Value
                     join fieldByRef in _fieldsByRef on refName equals fieldByRef.Key
                     where !fieldByRef.Value.Any()
                     select refByType.Key;
            var allFieldsTypes = q1.Distinct().ToArray();

            var q2a = from fk in _foreignKeys
                      select new
                      {
                          RefName = string.Empty,
                          FieldName = fk.Name
                      };
            var q2b = from fbr in _fieldsByRef
                      from field in fbr.Value
                      select new
                      {
                          RefName = fbr.Key,
                          FieldName = field
                      };
            var q2 = q2a.Union(q2b);

            var q3 = from refByType in _refsByType
                     where !allFieldsTypes.Contains(refByType.Key)
                     from refName in refByType.Value
                     join fieldByRef in q2 on refName equals fieldByRef.RefName
                     group fieldByRef.FieldName by refByType.Key into grp
                     select new
                     {
                         Key = grp.Key,
                         Fields = grp.Distinct().ToArray()
                     };
            var q4 = from t in allFieldsTypes
                     select new
                     {
                         Key = t,
                         Fields = new string[] { }
                     };

            var dic = q3.Union(q4).ToDictionary(x => x.Key, x => x.Fields);
            return dic;
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
        /// Retourne les métadonnées pour les champs associés à des références à charger.
        /// </summary>
        /// <returns>Métadonnées des champs regroupés par type.</returns>
        public IDictionary<Type, List<FieldDefinition>> GetForeignKeyFields()
        {
            return _foreignKeyFields;
        }

        private void AddForeignKeyField(Type type, FieldDefinition fieldDef)
        {
            if (!_foreignKeyFields.ContainsKey(type))
            {
                _foreignKeyFields.Add(type, fieldDef);
            }
        }

        private FieldDefinition ParseField(StringBuilder buffer, Tuple<ModelDefinition, string> tpl)
        {
            if (buffer.Length == 0)
            {
                return null;
            }

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
                    AddForeignKeyField(fieldDef.FieldType, fkFieldDef);
                    AddResult(fieldDef.FieldType, fieldDef.Name);
                }
            }
            else
            {
                AddResult(tpl.Item1.ModelType, tpl.Item2, fieldDef.Name);
            }

            return fieldDef;
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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="fields"></param>
        /// <param name="type"></param>
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

                    var fieldDef = ParseField(buffer, stack.Peek());
                    if (fieldDef == null)
                    {
                        i = index + 1; // on saute tout le contenu de la parenthèse non valable
                    }
                    else if (!fieldDef.IsReference)
                    {
                        throw new ArgumentException(
                            string.Format("Le champ '{0}' n'est pas une référence dans : '{1}'", fieldDef.Name, fields));
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
