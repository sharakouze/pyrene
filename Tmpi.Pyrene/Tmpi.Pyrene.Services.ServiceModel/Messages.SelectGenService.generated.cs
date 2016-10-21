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
	/// Retourne une collection des ressources Service.
	/// </summary>
	/// <seealso cref="GenService"/>
	[Route("/Service", HttpVerbs.Get, Summary = "Retourne une collection des ressources Service.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class SelectGenService : IReturn<SelectGenServiceResponse>, IGet
	{
		public int? Skip { get; set; }

		public int? Take { get; set; }

		public string[] Sort { get; set; }
	}

	public partial class SelectGenServiceResponse
	{
	}
}
