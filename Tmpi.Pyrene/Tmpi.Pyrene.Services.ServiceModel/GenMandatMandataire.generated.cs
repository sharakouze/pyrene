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
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenMandatMandataire spécifiée est introuvable.")]
	[Route("/GenMandat/Mandataire", HttpVerbs.Post, Summary = "Ajoute une ressource GenMandatMandataire.")]
	[Route("/GenMandat/Mandataire/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenMandatMandataire à partir de son Id.")]
	partial class GenMandatMandataire
	{
	}
}
