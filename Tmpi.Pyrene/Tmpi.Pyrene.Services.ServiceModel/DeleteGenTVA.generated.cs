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
	/// Supprime une ressource TVA.
	/// </summary>
	/// <seealso cref="GenTVA" />
	[Route("/TVA/{CleTVA}", HttpVerbs.Delete, Summary = "Supprime une ressource TVA.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource TVA spécifiée est introuvable.")]
	public partial class DeleteGenTVA : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de la ressource à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleTVA { get; set; }

	}
}
