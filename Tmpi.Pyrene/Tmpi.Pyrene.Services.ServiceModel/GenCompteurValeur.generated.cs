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
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenCompteurValeur spécifiée est introuvable.")]
	[Route("/GenCompteur/Valeur", HttpVerbs.Post, Summary = "Ajoute une ressource GenCompteurValeur.")]
	[Route("/GenCompteur/Valeur/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenCompteurValeur à partir de son Id.")]
	partial class GenCompteurValeur
	{
	}
}
