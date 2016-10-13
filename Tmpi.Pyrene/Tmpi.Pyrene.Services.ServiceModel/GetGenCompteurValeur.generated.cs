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
	/// Retourne une ressource <see cref="GenCompteurValeur" />.
	/// </summary>
	[Route("/Compteur/Valeur/{CleValeur}", HttpVerbs.Get, Summary = "Retourne une ressource GenCompteurValeur.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource GenCompteurValeur ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenCompteurValeur spécifiée est introuvable.")]
	public partial class GetGenCompteurValeur : IReturn<GenCompteurValeur>
	{
        /// <summary>
        /// CleCompteur de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "CleCompteur de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleCompteur { get; set; }

        /// <summary>
        /// CleValeur de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "CleValeur de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleValeur { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
