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
	/// Retourne une ressource <see cref="GenFournContact" />.
	/// </summary>
	[Route("/GenFourn/{CodFourn}/Contact/{NomContact}", HttpVerbs.Get, Summary = "Retourne une ressource 'GenFournContact'.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource 'GenFournContact' ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource 'GenFournContact' spécifiée est introuvable.")]
	public partial class GetGenFournContact : IReturn<GenFournContact>
	{
        /// <summary>
        /// Code unique.
        /// </summary>
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string CodFourn { get; set; }

        /// <summary>
        /// Nom de famille.
        /// </summary>
		[ApiMember(Description = "Nom de famille.", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string NomContact { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
