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

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenSociete spécifiée est introuvable.")]
	[Route("/GenSociete", HttpVerbs.Post, Summary = "Ajoute une ressource GenSociete.")]
	[Route("/GenSociete/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenSociete à partir de son Id.")]
	partial class GenSociete
	{
	}
}
