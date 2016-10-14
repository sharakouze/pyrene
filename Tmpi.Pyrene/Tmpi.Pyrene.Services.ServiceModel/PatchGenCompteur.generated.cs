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
	/// Modifie partiellement une ressource Compteur.
	/// </summary>
	/// <seealso cref="GenCompteur"/>
	[Route("/Compteur/{CleCompteur}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource Compteur.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource Compteur ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Compteur spécifiée est introuvable.")]
	public partial class PatchGenCompteur : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de la ressource à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleCompteur { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
