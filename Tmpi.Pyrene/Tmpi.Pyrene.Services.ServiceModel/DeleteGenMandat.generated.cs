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

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Supprime une ressource <see cref="GenMandat" /> à partir de son Id.
	/// </summary>
	[Route("/GenMandat/{Id}", HttpVerbs.Delete, Summary = "Supprime une ressource GenMandat à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenMandat spécifiée est introuvable.")]
	public partial class DeleteGenMandat : IReturnVoid
	{
        /// <summary>
        /// Id de la ressource <see cref="GenMandat" /> à supprimer.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenMandat à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }
	}
}
