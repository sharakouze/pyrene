using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceStack.OrmLite;

namespace Tmpi.Pyrene.Common
{
    public static class ModelDefinitionHelper
    {
        public static void UndefinedFields<T>(string fields)
        {
        }
        public static void UndefinedFields<T>(IEnumerable<string> fields)
        {
            if (fields == null)
            {
                return;
            }
            var modelDef = typeof(T).GetModelMetadata();
            if (modelDef != null)
            {
                var lst = fields.Where(f => !modelDef.FieldDefinitions.Select(fd => fd.Name).Contains(f, StringComparer.OrdinalIgnoreCase));
                if (lst.Any())
                {
                    string str = string.Join(", ", lst.Select(f => "'" + f + "'"));
                    throw new ArgumentException(
                        string.Format(ServiceErrorMessages.EntityFieldsNotFound, nameof(T), str));
                }
            }
        }
    }
}
