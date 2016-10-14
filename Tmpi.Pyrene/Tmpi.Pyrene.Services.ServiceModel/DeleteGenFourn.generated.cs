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
	/// Supprime une ressource Fourn.
	/// </summary>
	/// <seealso cref="GenFourn"/>
	[Route("/Fourn/{CleFourn}", HttpVerbs.Delete, Summary = "Supprime une ressource Fourn.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Fourn spécifiée est introuvable.")]
	public partial class DeleteGenFourn : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de la ressource à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleFourn { get; set; }

	}
}
