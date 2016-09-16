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
	/// Retourne une ressource <see cref="GenFournContact" /> à partir de son Id.
	/// </summary>
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournContact spécifiée est introuvable.")]
	[Route("/GenFourn/Contact/{Id}", HttpVerbs.Get, Summary = "Retourne une ressource GenFournContact à partir de son Id.")]
	public partial class GetGenFournContact : GetByIdRequestBase<int, GenFournContact>
	{
	}
}
