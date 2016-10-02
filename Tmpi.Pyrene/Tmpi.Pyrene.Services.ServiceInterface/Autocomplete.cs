using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tmpi.Pyrene.Services.ServiceModel;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceInterface
{
    public static class Autocomplete
    {
        public static List<BasicEntity> Auto<T>(IDbConnection db, string text, int max)
            where T : IEntity
        {
            var q = db.From<T>().Where(x => x.LibObjet.Contains(text));
            if (max > 0)
            {
                q = q.Limit(max);
            }

            var items = db.Select<BasicEntity>(q);
            return items;
        }
    }
}
