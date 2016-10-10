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
	/// Modifie partiellement une ressource <see cref="GenSecteur" />.
	/// </summary>
	[Route("/Secteur/{CodSecteur}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource 'GenSecteur'.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource 'GenSecteur' ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource 'GenSecteur' spécifiée est introuvable.")]
	public partial class PatchGenSecteur : IReturnVoid
	{
        /// <summary>
        /// Code unique.
        /// </summary>
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string CodSecteur { get; set; }

        /// <summary>
        /// Liste des modifications.
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}
}
