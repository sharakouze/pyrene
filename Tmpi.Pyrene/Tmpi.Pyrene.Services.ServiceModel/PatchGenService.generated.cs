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
	/// Modifie une entité <see cref="GenService" /> à partir de son Id.
	/// </summary>
	[Route("/GenService/{Id}", "PATCH", Summary = "Modifie une entité GenService à partir de son Id.")]
	public partial class PatchGenService : PatchByIdRequestBase<int>
	{
	}
}
