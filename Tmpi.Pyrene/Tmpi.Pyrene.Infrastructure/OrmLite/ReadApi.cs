using System;
using System.Collections.Generic;
using System.Data;
using ServiceStack.OrmLite;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Infrastructure.OrmLite
{
    public static class ReadApi
    {
        public static T SelectRef<T>(this IDbConnection dbConn, string fields, int? skip, int? take)
        {
            var q = dbConn.From<T>()
                .Limit(skip, take);

            return default(T);
        }
    }
}
