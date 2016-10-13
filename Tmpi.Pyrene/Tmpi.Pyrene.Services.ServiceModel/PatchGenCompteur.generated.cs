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
	/// Modifie partiellement une ressource <see cref="GenCompteur" />.
	/// </summary>
	[Route("/Compteur/{CleCompteur}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenCompteur.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenCompteur ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenCompteur spécifiée est introuvable.")]
	public partial class PatchGenCompteur : IReturnVoid
	{
        /// <summary>
        /// {0} de la ressource {1} à modifier.
        /// </summary>
		[ApiMember(Description = "{0} de la ressource {1} à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleCompteur { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
