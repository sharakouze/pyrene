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
	/// Modifie partiellement une ressource <see cref="GenMandatMandataire" />.
	/// </summary>
	[Route("/GenMandat/{CodMandat}/Mandataire/{ClePersonne}/{CleSociete}/{CleSecteur}/{CleService}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenMandatMandataire.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenMandatMandataire ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenMandatMandataire spécifiée est introuvable.")]
	public partial class PatchGenMandatMandataire : IReturnVoid
	{
        /// <summary>
        /// Code unique.
        /// </summary>
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string CodMandat { get; set; }

        /// <summary>
        /// Utilisateur mandataire.
        /// </summary>
		[ApiMember(Description = "Utilisateur mandataire.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int ClePersonne { get; set; }

        /// <summary>
        /// Société ayant accès au mandat, ou null pour toutes les sociétés.
        /// </summary>
		[ApiMember(Description = "Société ayant accès au mandat, ou null pour toutes les sociétés.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int? CleSociete { get; set; }

        /// <summary>
        /// Secteur ayant accès au mandat, ou null pour tous les secteurs.
        /// </summary>
		[ApiMember(Description = "Secteur ayant accès au mandat, ou null pour tous les secteurs.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int? CleSecteur { get; set; }

        /// <summary>
        /// Service ayant accès au mandat, ou null pour tous les services.
        /// </summary>
		[ApiMember(Description = "Service ayant accès au mandat, ou null pour tous les services.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int? CleService { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
