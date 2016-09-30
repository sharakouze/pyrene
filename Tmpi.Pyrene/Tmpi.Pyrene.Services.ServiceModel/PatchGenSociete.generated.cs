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
	/// Modifie une ressource <see cref="GenSociete" /> à partir de son Id.
	/// </summary>
	[Route("/GenSociete/{Id}", HttpVerbs.Patch, Summary = "Modifie une ressource GenSociete à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenSociete spécifiée est introuvable.")]
	public partial class PatchGenSociete : IReturnVoid
	{
        public int Id { get; set; }

        public PatchElement[] Fields { get; set; }
	}
}
