using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Core.Models.Messages.Requests
{
    interface ISortableRequest
    {
        string[] Sort { get; set; }
    }

    interface IPagingRequest : ISortableRequest
    {
        int Skip { get; set; }
        int Take { get; set; }
    }

    interface IPagingResponse
    {
        int TotalCount { get; set; }
    }

    class SelectSociete
    {
        
    }
}
