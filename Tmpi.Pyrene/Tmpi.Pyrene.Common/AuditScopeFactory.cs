using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Audit.Core;

namespace Tmpi.Pyrene.Common
{
    public static class AuditScopeFactory
    {
        public static AuditScope Create(string eventType, Func<object> targetGetter = null)
        {
            bool enabled = true;

            var options = new AuditScopeOptions();

            if (enabled)
            {
                options = new AuditScopeOptions(eventType, null, null, null, null, false, null, 0);
            }
            else
            {
                //options.DataProvider = NullDataProvider;
            }

            return AuditScope.Create(options);
        }
    }
}
