using ServiceStack;
using System.Collections.Generic;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public abstract class AutocompleteRequestBase : IReturn<List<string>>
    {
        public string Text { get; set; }
        public int Max { get; set; }
    }
}
