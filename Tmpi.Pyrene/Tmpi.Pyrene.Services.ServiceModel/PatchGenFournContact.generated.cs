//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Modifie une entité <see cref="GenFournContact" /> à partir de son Id.
	/// </summary>
	[Route("/GenFourn/Contact/{Id}", HttpVerbs.Patch, Summary = "Modifie une entité GenFournContact à partir de son Id.")]
	public partial class PatchGenFournContact : PatchByIdRequestBase<int>
	{
	}
}
