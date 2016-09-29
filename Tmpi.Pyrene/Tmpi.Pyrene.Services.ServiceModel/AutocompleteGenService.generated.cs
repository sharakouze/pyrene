//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Autocomplete une ressource <see cref="GenService" />.
	/// </summary>
	[Route("/GenService/Autocomplete/{Text}", HttpVerbs.Get, Summary = "Autocomplete une ressource GenService.")]
	public partial class AutocompleteGenService : IReturn<BasicEntity[]>
	{
        public string Text { get; set; }

        /// <summary>
        /// Nombre maximum d'éléments à retourner.
        /// </summary>
        public int Max { get; set; }
	}
}
