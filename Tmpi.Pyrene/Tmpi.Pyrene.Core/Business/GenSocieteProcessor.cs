using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using Nelibur.ServiceModel.Services.Operations;
using Tmpi.Pyrene.Core.Data;
using Tmpi.Pyrene.Models.Entities;
using Tmpi.Pyrene.Models.Messages;
using Tmpi.Pyrene.Models.Messages.Responses;
using Tmpi.Pyrene.Infrastructure.Messages;

namespace Tmpi.Pyrene.Core.Business
{
    public class GenSocieteProcessor :
        IGet<SelectGenSociete>
    {
        public object Get(SelectGenSociete request)
        {
            Debug.Assert(request != null);

            var response = new SelectSocieteResponse();

            using (var ctx = new CoreContext())
            {
                var q = from soc in ctx.Set<Gen_Societe>()
                        select soc;

                if (!EnumerableHelper.IsNullOrEmpty(request.CleSocieteList))
                {
                    // Filtre sur les clés primaires.
                    q = from soc in q
                        where request.CleSocieteList.Contains(soc.CleSociete)
                        select soc;
                }

                if (!string.IsNullOrEmpty(request.Filter))
                {
                    q = q.Where(request.Filter);
                }

                response.TotalCount = q.Count();

                q = QueryableHelper.Paging(q, request); // Pagination du résultat.

                if (EnumerableHelper.IsNullOrEmpty(request.Sort))
                {
                    // Tri par défaut.
                    q = from soc in q
                        orderby soc.LibSociete
                        select soc;
                }

                switch (request.ResultType)
                {
                    case BaseResultType.Simple:
                        var s = from soc in q
                                select new SimpleResult<int>()
                                {
                                    CleObjet = soc.CleSociete,
                                    CodObjet = soc.CodSociete,
                                    LibObjet = soc.LibSociete,
                                    EstActif = soc.EstActif,
                                };
                        response.Result = s.ToList();
                        break;

                    case BaseResultType.Entity:
                    default:
                        response.Result = q.Select(soc => soc).ToList();
                        break;
                }
            }

            return response;
        }
    }
}
