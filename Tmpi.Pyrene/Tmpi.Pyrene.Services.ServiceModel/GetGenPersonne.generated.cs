//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Retourne une ressource <see cref="GenPersonne" /> à partir de son Id.
	/// </summary>
	[Route("/GenPersonne/{Id}", HttpVerbs.Get, Summary = "Retourne une ressource GenPersonne à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonne spécifiée est introuvable.")]
	public partial class GetGenPersonne : IReturn<GenPersonne>
	{
        /// <summary>
        /// Id de la ressource <see cref="GenPersonne" /> à retourner.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenPersonne à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
