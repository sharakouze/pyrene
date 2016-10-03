using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceStack.OrmLite;

namespace Tmpi.Pyrene.Infrastructure
{
    public static class ModelDefinitionHelper
    {
        public static IEnumerable<string> GetUndefinedFields<T>(IEnumerable<string> fields)
        {
            var modelDef = typeof(T).GetModelMetadata();
            if (modelDef != null)
            {
                var lst = fields.Where(f => !modelDef.FieldDefinitions.Select(fd => fd.Name).Contains(f, StringComparer.InvariantCultureIgnoreCase));

                return lst;
            }

            return null;
        }
    }
}
