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
	/// Modifie partiellement une ressource <see cref="GenFournContact" />.
	/// </summary>
	[Route("/Fourn/{CleFourn}/Contact/{CleContact}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenFournContact.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenFournContact ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournContact spécifiée est introuvable.")]
	public partial class PatchGenFournContact : IReturnVoid
	{
        /// <summary>
        /// Clé primaire.
        /// </summary>
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int CleFourn { get; set; }

        /// <summary>
        /// Clé primaire.
        /// </summary>
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int CleContact { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
