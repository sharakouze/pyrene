using ServiceStack;
using ServiceStack.OrmLite;
using System;
using System.Diagnostics;
using Tmpi.Pyrene.ServiceModel.Messages;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceInterface
{
    public class GenSocieteService : Service
    {
        /// <summary>
        /// Retourne blablabla
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public GenSociete Get(GetGenSociete request)
        {
            Debug.Assert(request != null);
            if (request == null)
            {
                throw new ArgumentNullException(nameof(request));
            }

            //var q = Db.From<GenCompteur>().Join<GenCompteurValeur>();
            //q.ToAbsoluteUri();

            //var qqq = Db.Select<GenSociete>().Join<GenCompteur>();

            var soc = new GenSociete()
            {
                Id = request.Id,
                CodObjet = "XYZ",
                LibObjet = "test"
            };
            //var soc = Db.SingleById<GenSociete>(request.CleSociete);
            return soc;
        }
    }
}
