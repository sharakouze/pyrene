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
	/// Supprime une ressource <see cref="GenTVA" /> à partir de son Id.
	/// </summary>
	[Route("/GenTVA/{Id}", HttpVerbs.Delete, Summary = "Supprime une ressource GenTVA à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenTVA spécifiée est introuvable.")]
	public partial class DeleteGenTVA : IReturnVoid
	{
        /// <summary>
        /// Id de la ressource <see cref="GenTVA" /> à supprimer.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenTVA à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }
	}
}
