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
using Tmpi.Pyrene.Infrastructure;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Retourne une ressource <see cref="GenFournContact" /> à partir de son Id.
	/// </summary>
	[Route("/GenFourn/Contact/{Id}", HttpVerbs.Get, Summary = "Retourne une ressource GenFournContact à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournContact spécifiée est introuvable.")]
	public partial class GetGenFournContact : IReturn<GenFournContact>
	{
        /// <summary>
        /// Id de la ressource <see cref="GenFournContact" /> à retourner.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenFournContact à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
