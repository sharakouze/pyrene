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
	/// Retourne une entité <see cref="GenMandat" /> à partir de son Id.
	/// </summary>
	[Route("/GenMandat/{Id}", HttpVerbs.Get, Summary = "Retourne une entité GenMandat à partir de son Id.")]
	public partial class GetGenMandat : GetByIdRequestBase<int, GenMandat>
	{
	}
}
