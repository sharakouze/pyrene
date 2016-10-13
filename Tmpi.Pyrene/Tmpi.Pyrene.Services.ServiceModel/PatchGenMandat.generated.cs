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
	/// Modifie partiellement une ressource <see cref="GenMandat" />.
	/// </summary>
	[Route("/Mandat/{CleMandat}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenMandat.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenMandat ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenMandat spécifiée est introuvable.")]
	public partial class PatchGenMandat : IReturnVoid
	{
        /// <summary>
        /// {0} de la ressource {1} à modifier.
        /// </summary>
		[ApiMember(Description = "{0} de la ressource {1} à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleMandat { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
