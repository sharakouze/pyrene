//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Supprime une ressource <see cref="GenCompteur" /> à partir de son Id.
	/// </summary>
	[Route("/GenCompteur/{Id}", HttpVerbs.Delete, Summary = "Supprime une ressource GenCompteur à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenCompteur spécifiée est introuvable.")]
	public partial class DeleteGenCompteur : IReturnVoid
	{
        /// <summary>
        /// Id de la ressource <see cref="GenCompteur" /> à supprimer.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenCompteur à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }
	}
}
