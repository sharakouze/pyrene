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
	/// Retourne une ressource <see cref="GenService" />.
	/// </summary>
	[Route("/Service/{CleService}", HttpVerbs.Get, Summary = "Retourne une ressource GenService.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenService ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenService spécifiée est introuvable.")]
	public partial class GetGenService : IReturn<GenService>
	{
        /// <summary>
        /// CleService de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "CleService de la ressource à retourner.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int CleService { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
