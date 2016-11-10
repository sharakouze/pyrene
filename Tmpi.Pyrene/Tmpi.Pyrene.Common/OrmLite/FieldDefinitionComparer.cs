using ServiceStack.OrmLite;
using System.Collections.Generic;

namespace Tmpi.Pyrene.Common.OrmLite
{
    internal class FieldDefinitionComparer : IEqualityComparer<FieldDefinition>
    {
        public bool Equals(FieldDefinition x, FieldDefinition y)
        {
            if (x == y)
            {
                return true;
            }
            if (x == null || y == null)
            {
                return false;
            }
            return x.Name == y.Name;
        }

        public int GetHashCode(FieldDefinition obj)
        {
            if (obj == null || obj.Name == null)
            {
                return 0;
            }
            return obj.Name.GetHashCode();
        }
    }
}
