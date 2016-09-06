using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Tmpi.Pyrene.ServiceModel;

namespace Tmpi.Pyrene.ServiceInterface
{
    public static class PatchHelper
    {
        public static List<string> PopulateFromPatch<T>(T updateObject, IEnumerable<PatchElement> patches,
            bool convertEmptyStringAsNull = true)
        {
            var fields = new List<string>();

            var paramExpr = Expression.Parameter(typeof(T));

            foreach (var patch in patches)
            {
                var fieldExpr = Expression.Property(paramExpr, patch.Field);

                fields.Add(fieldExpr.Member.Name);

                if (convertEmptyStringAsNull && (object.Equals(patch.Value, string.Empty)))
                {
                    patch.Value = null;
                }
                if (patch.Value != null)
                {
                    var type = Nullable.GetUnderlyingType(fieldExpr.Type) ?? fieldExpr.Type;
                    patch.Value = Convert.ChangeType(patch.Value, type);
                }

                var valueExpr = Expression.Constant(patch.Value, fieldExpr.Type);

                var setter = Expression.Lambda<Action<T>>(Expression.Assign(fieldExpr, valueExpr), paramExpr).Compile();
                setter(updateObject);
            }

            return fields;
        }
    }
}
