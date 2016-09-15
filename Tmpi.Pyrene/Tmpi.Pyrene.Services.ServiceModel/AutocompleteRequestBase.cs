using ServiceStack;
using System.Collections.Generic;

namespace Tmpi.Pyrene.Services.ServiceModel
{
    public abstract class AutocompleteRequestBase : IReturn<List<string>>
    {
        public string Text { get; set; }

        public int Max { get; set; }
    }
}
