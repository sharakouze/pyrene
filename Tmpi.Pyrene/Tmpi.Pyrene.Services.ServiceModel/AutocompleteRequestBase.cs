using ServiceStack;
using System.Collections.Generic;

namespace Tmpi.Pyrene.Services.ServiceModel
{
    public abstract class AutocompleteRequestBase : IReturn<List<BasicEntity>>
    {
        public string Text { get; set; }

        /// <summary>
        /// Nombre maximum d'éléments à retourner.
        /// </summary>
        public int Max { get; set; }
    }
}
