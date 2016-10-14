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
	/// Retourne une ressource Contact (Fourn).
	/// </summary>
	/// <seealso cref="GenFournContact" />
	[Route("/Fourn/Contact/{CleContact}", HttpVerbs.Get, Summary = "Retourne une ressource Contact (Fourn).")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource Contact (Fourn) ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Contact (Fourn) spécifiée est introuvable.")]
	public partial class GetGenFournContact : IReturn<GenFournContact>
	{
        /// <summary>
        /// CleFourn de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "CleFourn de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleFourn { get; set; }

        /// <summary>
        /// CleContact de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "CleContact de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleContact { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
