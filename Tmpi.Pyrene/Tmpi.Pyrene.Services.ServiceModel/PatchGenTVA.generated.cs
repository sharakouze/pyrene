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
	/// Modifie une ressource <see cref="GenTVA" /> à partir de son Id.
	/// </summary>
	[Route("/GenTVA/{Id}", HttpVerbs.Patch, Summary = "Modifie une ressource GenTVA à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenTVA spécifiée est introuvable.")]
	public partial class PatchGenTVA : IReturnVoid
	{
        public int Id { get; set; }

        public PatchElement[] Fields { get; set; }
	}
}
