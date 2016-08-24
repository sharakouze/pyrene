using System.Collections;

namespace Tmpi.Pyrene.Models.Messages.Responses
{
    public class SelectSocieteResponse
    {
        public IList Result { get; set; }

        public int TotalCount { get; set; }
    }
}
