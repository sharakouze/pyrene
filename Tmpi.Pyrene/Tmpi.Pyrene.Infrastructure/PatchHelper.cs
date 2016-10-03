using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Tmpi.Pyrene.Infrastructure
{
    public static class PatchHelper
    {
        public static List<string> PopulateFromPatch<T>(T updateObject, Dictionary<string, object> patches,
            bool emptyStringAsNull = true)
        {
            var fields = new List<string>();

            var paramExpr = Expression.Parameter(typeof(T));

            foreach (var patch in patches)
            {
                object value = patch.Value;
                var fieldExpr = Expression.Property(paramExpr, patch.Key);

                fields.Add(fieldExpr.Member.Name);

                if (emptyStringAsNull && (object.Equals(value, string.Empty)))
                {
                    value = null;
                }
                if (value != null)
                {
                    var type = Nullable.GetUnderlyingType(fieldExpr.Type) ?? fieldExpr.Type;
                    value = Convert.ChangeType(value, type);
                }

                var valueExpr = Expression.Constant(value, fieldExpr.Type);

                var setter = Expression.Lambda<Action<T>>(Expression.Assign(fieldExpr, valueExpr), paramExpr).Compile();
                setter(updateObject);
            }

            return fields;
        }

        public static List<string> PopulateFromPatch<T>(Dictionary<string, object> patches,
            bool emptyStringAsNull = true) where T : new()
        {
            var updateObject = new T();

            var fields = new List<string>();

            var paramExpr = Expression.Parameter(typeof(T));

            foreach (var patch in patches)
            {
                object value = patch.Value;
                var fieldExpr = Expression.Property(paramExpr, patch.Key);

                fields.Add(fieldExpr.Member.Name);

                if (emptyStringAsNull && (object.Equals(value, string.Empty)))
                {
                    value = null;
                }
                if (value != null)
                {
                    var type = Nullable.GetUnderlyingType(fieldExpr.Type) ?? fieldExpr.Type;
                    value = Convert.ChangeType(value, type);
                }

                var valueExpr = Expression.Constant(value, fieldExpr.Type);

                var setter = Expression.Lambda<Action<T>>(Expression.Assign(fieldExpr, valueExpr), paramExpr).Compile();
                setter(updateObject);
            }

            return fields;
        }


        //public static List<string> PopulateFromPatch<T>(T updateObject, IEnumerable<Patch> patches,
        //    bool emptyStringAsNull = true)
        //{
        //    var fields = new List<string>();

        //    var paramExpr = Expression.Parameter(typeof(T));

        //    foreach (var patch in patches)
        //    {
        //        var fieldExpr = Expression.Property(paramExpr, patch.Field);

        //        fields.Add(fieldExpr.Member.Name);

        //        if (emptyStringAsNull && (object.Equals(patch.Value, string.Empty)))
        //        {
        //            patch.Value = null;
        //        }
        //        if (patch.Value != null)
        //        {
        //            var type = Nullable.GetUnderlyingType(fieldExpr.Type) ?? fieldExpr.Type;
        //            patch.Value = Convert.ChangeType(patch.Value, type);
        //        }

        //        var valueExpr = Expression.Constant(patch.Value, fieldExpr.Type);

        //        var setter = Expression.Lambda<Action<T>>(Expression.Assign(fieldExpr, valueExpr), paramExpr).Compile();
        //        setter(updateObject);
        //    }

        //    return fields;
        //}
    }
}
