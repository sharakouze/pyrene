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

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	[Route("/GenPersonne/Profil", HttpVerbs.Post, Summary = "Ajoute une ressource GenPersonneProfil.")]
	[Route("/GenPersonne/Profil/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenPersonneProfil à partir de son Id.")]
	partial class GenPersonneProfil
	{
	}
}
