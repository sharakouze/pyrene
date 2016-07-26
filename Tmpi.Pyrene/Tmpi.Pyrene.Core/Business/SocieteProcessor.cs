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

                if (request.CleSocieteList != null && request.CleSocieteList.Any())
                {
                    q = q.Where(soc => request.CleSocieteList.Contains(soc.CleSociete));
                }

                var response = new SelectSocieteResponse()
                {
                    TotalCount = q.Count(),
                };

                q = q.ToPaging(request, soc => soc.CleSociete);


                switch (request.ResultType)
                {
                    case "":
                        response.Result = q.Select(soc => new
                        {
                            soc.CodExterne
                        }
                        ).ToList();
                        break;
                }

                return response;
            }
        }
    }
}
