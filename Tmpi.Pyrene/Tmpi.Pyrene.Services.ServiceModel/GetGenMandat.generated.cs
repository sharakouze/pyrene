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
	/// Retourne une ressource <see cref="GenMandat" />.
	/// </summary>
	[Route("/Mandat/{CodMandat}", HttpVerbs.Get, Summary = "Retourne une ressource 'GenMandat'.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource 'GenMandat' ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource 'GenMandat' spécifiée est introuvable.")]
	public partial class GetGenMandat : IReturn<GenMandat>
	{
        /// <summary>
        /// Code unique.
        /// </summary>
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string CodMandat { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
