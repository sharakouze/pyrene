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
	/// Modifie partiellement une ressource Fourn.
	/// </summary>
	/// <seealso cref="GenFourn"/>
	[Route("/Fourn/{CleFourn}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource Fourn.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource Fourn ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Fourn spécifiée est introuvable.")]
	public partial class PatchGenFourn : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de la ressource à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleFourn { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
