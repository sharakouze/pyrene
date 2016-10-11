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
	/// Modifie partiellement une ressource <see cref="GenTVA" />.
	/// </summary>
	[Route("/GenTVA/{CodTVA}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenTVA.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenTVA ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenTVA spécifiée est introuvable.")]
	public partial class PatchGenTVA : IReturnVoid
	{
        /// <summary>
        /// Code unique.
        /// </summary>
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string CodTVA { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
