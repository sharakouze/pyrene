//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Supprime une ressource <see cref="GenPersonneProfil" />.
	/// </summary>
	[Route("/GenPersonne/{CodPersonne}/GenPersonneProfil/{CodProfil}", HttpVerbs.Delete, Summary = "Supprime une ressource GenPersonneProfil.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	public partial class DeleteGenPersonneProfil : IReturnVoid
	{
        /// <summary>
        /// Code unique.
        /// </summary>
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string CodPersonne { get; set; }

        /// <summary>
        /// Code.
        /// </summary>
		[ApiMember(Description = "Code.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string CodProfil { get; set; }

	}
}
