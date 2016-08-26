using ServiceStack;
using System;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public class GetGenCompteur : IReturn<GenCompteur>, IGetByIdRequest<int>
    {
        public int CleCompteur { get; set; }

        public int Id { get; set; }
    }
}
