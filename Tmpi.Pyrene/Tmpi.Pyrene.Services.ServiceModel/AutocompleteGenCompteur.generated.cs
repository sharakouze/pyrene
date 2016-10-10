//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Retourne des prédictions sur les ressources '<see cref="GenCompteur" />'.
	/// </summary>
	[Route("/GenCompteur/Autocomplete/{Text}", HttpVerbs.Get, Summary = "Retourne des prédictions sur les ressources 'GenCompteur'.")]
	public partial class AutocompleteGenCompteur : IReturn<BasicEntity[]>
	{
        /// <summary>
        /// Texte à rechercher.
        /// </summary>
        [ApiMember(Description = "Texte à rechercher.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string Text { get; set; }

        /// <summary>
        /// Nombre maximum de prédictions à retourner.
        /// </summary>
        [ApiMember(Description = "Nombre maximum de prédictions à retourner.", DataType = SwaggerDataTypes.Int)]
        public int Max { get; set; }
	}
}
