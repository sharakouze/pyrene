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
	/// Modifie une ressource <see cref="GenPersonneProfil" /> à partir de son Id.
	/// </summary>
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	[Route("/GenPersonne/Profil/{Id}", HttpVerbs.Patch, Summary = "Modifie une ressource GenPersonneProfil à partir de son Id.")]
	public partial class PatchGenPersonneProfil : PatchByIdRequestBase<int>
	{
	}
}
