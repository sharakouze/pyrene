using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Tmpi.Pyrene.Infrastructure
{
    public static class PatchHelper
    {
        public static T PopulateFromPatch<T>(T updateObject, Dictionary<string, object> patches,
            bool emptyStringAsNull = true)
        {
            var paramExpr = Expression.Parameter(typeof(T));

            foreach (var patch in patches)
            {
                object value = patch.Value;
                var fieldExpr = Expression.Property(paramExpr, patch.Key);

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

            return updateObject;
        }
    }
}
