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
	/// Supprime une ressource <see cref="GenFourn" /> à partir de son Id.
	/// </summary>
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFourn spécifiée est introuvable.")]
	[Route("/GenFourn/{Id}", HttpVerbs.Delete, Summary = "Supprime une ressource GenFourn à partir de son Id.")]
	public partial class DeleteGenFourn : IReturnVoid
	{
        public int Id { get; set; }
	}
}
