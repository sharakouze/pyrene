//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using ServiceStack;

namespace Tmpi.Pyrene.Services.ServiceModel.Messages
{
	/// <summary>
	/// Retourne une collection des ressources Mandat.
	/// </summary>
	/// <seealso cref="GenMandat"/>
	[Route("/Mandat", HttpVerbs.Get, Summary = "Retourne une collection des ressources Mandat.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class SelectGenMandat : IReturn<SelectGenMandatResponse>, IGet
	{
		public int? Skip { get; set; }

		public int? Take { get; set; }

		public string[] Sort { get; set; }
	}

	public partial class SelectGenMandatResponse
	{
	}
}
