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
	/// Retourne une ressource Personne.
	/// </summary>
	/// <seealso cref="GenPersonne" />
	[Route("/Personne/{ClePersonne}", HttpVerbs.Get, Summary = "Retourne une ressource Personne.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource Personne ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Personne spécifiée est introuvable.")]
	public partial class GetGenPersonne : IReturn<GenPersonne>
	{
        /// <summary>
        /// ClePersonne de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "ClePersonne de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int ClePersonne { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
