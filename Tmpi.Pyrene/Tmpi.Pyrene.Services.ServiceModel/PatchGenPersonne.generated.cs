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
	/// Modifie partiellement une ressource <see cref="GenPersonne" />.
	/// </summary>
	[Route("/Personne/{ClePersonne}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenPersonne.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenPersonne ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonne spécifiée est introuvable.")]
	public partial class PatchGenPersonne : IReturnVoid
	{
        /// <summary>
        /// Clé primaire.
        /// </summary>
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int ClePersonne { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
