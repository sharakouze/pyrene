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
	/// Modifie partiellement une ressource <see cref="GenService" />.
	/// </summary>
	[Route("/Service/{CleService}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenService.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenService ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenService spécifiée est introuvable.")]
	public partial class PatchGenService : IReturnVoid
	{
        /// <summary>
        /// Clé primaire.
        /// </summary>
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int CleService { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
