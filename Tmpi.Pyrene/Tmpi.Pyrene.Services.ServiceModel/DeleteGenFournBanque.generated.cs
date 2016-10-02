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
	/// Supprime une ressource <see cref="GenFournBanque" /> à partir de son Id.
	/// </summary>
	[Route("/GenFourn/Banque/{Id}", HttpVerbs.Delete, Summary = "Supprime une ressource GenFournBanque à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournBanque spécifiée est introuvable.")]
	public partial class DeleteGenFournBanque : IReturnVoid
	{
        /// <summary>
        /// Id de la ressource <see cref="GenFournBanque" /> à supprimer.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenFournBanque à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }
	}
}
