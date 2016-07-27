using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using Nelibur.ServiceModel.Services.Operations;
using Tmpi.Pyrene.Core.Data;
using Tmpi.Pyrene.Core.Models.Entities;
using Tmpi.Pyrene.Core.Models.Messages;
using Tmpi.Pyrene.Core.Models.Messages.Responses;
using Tmpi.Pyrene.Infrastructure.Messages;

namespace Tmpi.Pyrene.Core.Business
{
    public class SocieteProcessor :
        IGet<SelectSociete>
    {
        public object Get(SelectSociete request)
        {
            Debug.Assert(request != null);

            using (var ctx = new CoreContext())
            {
                var q = ctx.Set<Societe>().AsQueryable();

                if (!EnumerableHelper.IsNullOrEmpty(request.CleSocieteList))
                {
                    q = q.Where(soc => request.CleSocieteList.Contains(soc.CleSociete));
                }

                var response = new SelectSocieteResponse()
                {
                    TotalCount = q.Count(),
                };

                q = QueryableHelper.Pagination(q, request);

                if (EnumerableHelper.IsNullOrEmpty(request.Sort))
                {
                    q = q.OrderBy(soc => soc.LibSociete); // Tri par défaut.
                }

                switch (request.ResultType)
                {

                    case BaseResultType.Entity:
                    default:
                        response.Result = q.Select(soc => soc).ToList();
                        break;
                }

                return response;
            }
        }
    }
}
