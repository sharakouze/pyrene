using System.Collections.Generic;

namespace Tmpi.Pyrene.Infrastructure
{
    public abstract class AutocompleteRequestBase //: IReturn<List<string>>
    {
        public string Text { get; set; }
        public int Max { get; set; }
    }
}
