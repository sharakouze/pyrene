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
	/// Retourne les ressources Valeur (Compteur).
	/// </summary>
	/// <seealso cref="GenCompteurValeur"/>
	[Route("/Compteur/{CleCompteur}/Valeur", HttpVerbs.Get, Summary = "Retourne les ressources Valeur (Compteur).")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class SelectGenCompteurValeur : IReturn<List<GenCompteurValeur>>, IGet
	{
        /// <summary>
        /// Identifiant unique du compteur parent
        /// </summary>
		[ApiMember(Description = "Identifiant unique du compteur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleCompteur { get; set; }

		public int? Skip { get; set; }

		public int? Take { get; set; }

		public string[] Sort { get; set; }
	}
}
