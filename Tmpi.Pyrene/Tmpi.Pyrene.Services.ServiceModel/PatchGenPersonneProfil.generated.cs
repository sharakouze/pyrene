//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using ServiceStack;
using Tmpi.Pyrene.Infrastructure;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Modifie une entité <see cref="GenPersonneProfil" /> à partir de son Id.
	/// </summary>
	[Route("/GenPersonne/Profil/{Id}", "PATCH", Summary = "Modifie une entité GenPersonneProfil à partir de son Id.")]
	public partial class PatchGenPersonneProfil : PatchByIdRequestBase<int>
	{
	}
}
