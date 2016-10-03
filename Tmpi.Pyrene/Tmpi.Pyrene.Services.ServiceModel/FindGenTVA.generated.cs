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

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Retourne un ensemble de ressources <see cref="GenTVA" />.
	/// </summary>
	[Route("/GenTVA", HttpVerbs.Get, Summary = "Retourne un ensemble de ressources GenTVA.")]
	public partial class FindGenTVA : IReturn<BasicEntity[]>
	{
        /// <summary>
        /// Texte à rechercher.
        /// </summary>
        [ApiMember(Description = "Texte à rechercher.", DataType = SwaggerDataTypes.Int)]
        public int Skip { get; set; }

        /// <summary>
        /// Nombre maximum d'éléments à retourner.
        /// </summary>
        [ApiMember(Description = "Nombre maximum d'éléments à retourner.", DataType = SwaggerDataTypes.Int)]
        public int Take { get; set; }

        public string Sort { get; set; }
	}
}