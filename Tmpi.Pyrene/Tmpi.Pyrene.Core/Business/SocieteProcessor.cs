using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using System.Text;
using System.Threading.Tasks;
using Nelibur.ServiceModel.Services.Operations;
using Tmpi.Pyrene.Core.Data;
using Tmpi.Pyrene.Core.Models.Entities;
using Tmpi.Pyrene.Core.Models.Messages.Requests;
using Tmpi.Pyrene.Core.Models.Messages.Responses;
using System.Data.Entity;
using System.Collections;
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



                if (request.Skip > 0)
                {
                    q = q.Skip(request.Skip);
                }
                if (request.Take > 0)
                {
                    q = q.Take(request.Take);
                }

                if (request.Sort == null || !request.Sort.Any())
                {
                    q = q.OrderBy(soc => soc.LibSociete); // Tri par défaut.
                }
                else
                {
                    foreach (string s in request.Sort)
                    {
                        //source = source.OrderBy(s);
                    }
                }

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
