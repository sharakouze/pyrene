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
	/// Retourne une ressource <see cref="GenSecteur" /> à partir de son Id.
	/// </summary>
	[Route("/GenSecteur/{Id}", HttpVerbs.Get, Summary = "Retourne une ressource GenSecteur à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenSecteur spécifiée est introuvable.")]
	public partial class GetGenSecteur : IReturn<GenSecteur>
	{
        /// <summary>
        /// Id de la ressource <see cref="GenSecteur" /> à retourner.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenSecteur à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int Id { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}
}
