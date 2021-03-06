﻿using ServiceStack.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tmpi.Pyrene.Common.OrmLite
{
    public class FieldParser
    {
        public static string ForeignKeyFieldFormat = "Cle{0}";

        private readonly FieldDefinitionComparer _fieldDefComparer = new FieldDefinitionComparer();

        private readonly Dictionary<Type, List<string>> _refsByType = new Dictionary<Type, List<string>>();
        private readonly Dictionary<string, List<FieldDefinition>> _fieldsByRef = new Dictionary<string, List<FieldDefinition>>();
        private readonly Dictionary<Type, List<FieldDefinition>> _fkFieldsByType = new Dictionary<Type, List<FieldDefinition>>();
        private readonly Dictionary<Type, List<string>> _errors = new Dictionary<Type, List<string>>();

        /// <summary>
        /// Supprime tous les éléments de <see cref="FieldParser"/>.
        /// </summary>
        private void Clear()
        {
            _refsByType.Clear();
            _fieldsByRef.Clear();
            _fkFieldsByType.Clear();
            _errors.Clear();
        }

        /// <summary>
        /// Obtient une valeur indiquant si l'analyse n'a pas trouvé certains champs.
        /// </summary>
        public bool HasFieldsNotFound
        {
            get
            {
                return _errors.Any();
            }
        }

        /// <summary>
        /// Retourne les noms des champs non trouvés par type.
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
        /// Retourne le résultat de l'analyse des champs trouvés par type.
        /// </summary>
        /// <returns>Définition des champs trouvés regroupés par type.</returns>
        public IDictionary<Type, FieldDefinition[]> GetFieldsByType()
        {
            // types pour lesquels on fera un select *
            var q1 = from refByType in _refsByType
                     from refName in refByType.Value
                     join fieldByRef in _fieldsByRef on refName equals fieldByRef.Key
                     where !fieldByRef.Value.Any()
                     select refByType.Key;
            var allFieldsTypes = q1.Distinct().ToArray();

            var q2a = from fk in _fkFieldsByType
                      from fieldDef in fk.Value
                      select new
                      {
                          RefName = string.Empty,
                          FieldDef = fieldDef
                      };
            var q2b = from fbr in _fieldsByRef
                      from fieldDef in fbr.Value
                      select new
                      {
                          RefName = fbr.Key,
                          FieldDef = fieldDef
                      };
            var q2 = q2a.Union(q2b);

            var q3 = from refByType in _refsByType
                     where !allFieldsTypes.Contains(refByType.Key)
                     from refName in refByType.Value
                     join fieldByRef in q2 on refName equals fieldByRef.RefName
                     group fieldByRef.FieldDef by refByType.Key into grp
                     select new
                     {
                         Type = grp.Key,
                         Fields = grp.Distinct(_fieldDefComparer).ToArray()
                     };
            var q4 = from t in allFieldsTypes
                     select new
                     {
                         Type = t,
                         Fields = new FieldDefinition[] { }
                     };

            var dic = q3.Union(q4).ToDictionary(x => x.Type, x => x.Fields);
            return dic;
        }

        private void AddResult(Type refType, string refField, FieldDefinition fieldDef = null)
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

            List<FieldDefinition> lstFieldDefs;
            _fieldsByRef.TryGetValue(refField, out lstFieldDefs);
            if (lstFieldDefs == null)
            {
                lstFieldDefs = new List<FieldDefinition>();
                _fieldsByRef.Add(refField, lstFieldDefs);
            }
            if (fieldDef != null && !lstFieldDefs.Contains(fieldDef, _fieldDefComparer))
            {
                lstFieldDefs.Add(fieldDef);
            }
        }

        /// <summary>
        /// Retourne le résultat de l'analyse des champs trouvés étant associés à des références.
        /// </summary>
        /// <returns>Définition des champs regroupés par type.</returns>
        public IDictionary<Type, List<FieldDefinition>> GetForeignKeyFields()
        {
            return _fkFieldsByType;
        }

        private void AddForeignKeyField(Type type, FieldDefinition fieldDef)
        {
            List<FieldDefinition> lstFieldDefs;
            _fkFieldsByType.TryGetValue(type, out lstFieldDefs);
            if (lstFieldDefs == null)
            {
                lstFieldDefs = new List<FieldDefinition>();
                _fkFieldsByType.Add(type, lstFieldDefs);
            }
            if (!lstFieldDefs.Contains(fieldDef, _fieldDefComparer))
            {
                lstFieldDefs.Add(fieldDef);
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
                    throw new ArgumentException("Les références imbriquées sur plus d'un niveau ne sont pas supportés.");
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
                AddResult(tpl.Item1.ModelType, tpl.Item2, fieldDef);
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



        //private void ParseField2(string field, char separator, ModelDefinition modelDef)
        //{
        //    var fieldDef = modelDef.AllFieldDefinitionsArray
        //        .FirstOrDefault(f => string.Equals(f.Name, field, StringComparison.OrdinalIgnoreCase));
        //    if (fieldDef == null)
        //    {
        //        AddError(modelDef.ModelType, field);
        //    }
        //    else if (fieldDef.IsReference)
        //    {
        //        if (!string.IsNullOrEmpty(tpl.Item2))
        //        {
        //            throw new ArgumentException("Les références imbriquées sur plus d'un niveau ne sont pas supportés.");
        //        }

        //        string fkFieldName = string.Format(ForeignKeyFieldFormat, fieldDef.Name);
        //        var fkFieldDef = modelDef.FieldDefinitions
        //            .FirstOrDefault(f => string.Equals(f.Name, fkFieldName, StringComparison.OrdinalIgnoreCase));
        //        if (fkFieldDef == null)
        //        {
        //            throw new Exception(
        //                string.Format("Impossible de trouver un champ '{0}' associé à '{1}.{2}'", fkFieldName, modelDef.Name, fieldDef.Name));
        //        }
        //        else
        //        {
        //            AddForeignKeyField(fieldDef.FieldType, fkFieldDef);
        //            AddResult(fieldDef.FieldType, fieldDef.Name);
        //        }
        //    }
        //    else
        //    {
        //        AddResult(modelDef.ModelType, tpl.Item2, fieldDef);
        //    }
        //}

        //public void Load2(string fields, Type type)
        //{
        //    Clear();

        //    var buffer = new StringBuilder();

        //    var baseModefDef = type.GetModelMetadata();
        //    AddResult(type, string.Empty);

        //    var tpl = new Tuple<ModelDefinition, string>(baseModefDef, string.Empty);

        //    for (int i = 0; i < fields.Length; i++)
        //    {
        //        char c = fields[i];

        //        if (c == ',' || c == '(' || c == ')')
        //        {
        //            if (buffer.Length > 0)
        //            {
        //                string field = buffer.ToString();
        //                buffer.Clear();

        //                var fieldDef = tpl.Item1.AllFieldDefinitionsArray
        //                    .FirstOrDefault(f => string.Equals(f.Name, field, StringComparison.OrdinalIgnoreCase));
        //                if (fieldDef == null)
        //                {
        //                    AddError(tpl.Item1.ModelType, field);
        //                }
        //                else
        //                {
        //                    switch (c)
        //                    {
        //                        case ',':
        //                            var tpl = stack.Peek();
        //                            break;
        //                        case '(':
        //                            var tpl = stack.Peek();
        //                            break;
        //                        case ')':
        //                            var tpl = stack.Pop();
        //                            break;
        //                    }
        //                }
        //            }
        //        }
        //        else if (c != ' ')
        //        {
        //            buffer.Append(c);
        //        }
        //    }

        //    ParseField(buffer, stack.Peek());
        //}
    }
}
