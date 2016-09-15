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
	/// Supprime une entité <see cref="GenPersonneProfil" /> à partir de son Id.
	/// </summary>
    [ApiResponse(HttpStatusCode.NotFound, "L'entité GenPersonneProfil spécifiée est introuvable.")]
	[Route("/GenPersonne/Profil/{Id}", HttpVerbs.Delete, Summary = "Supprime une entité GenPersonneProfil à partir de son Id.")]
	public partial class DeleteGenPersonneProfil : DeleteByIdRequestBase<int>
	{
	}
}
