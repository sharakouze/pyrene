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
	/// Supprime une ressource <see cref="GenSecteur" />.
	/// </summary>
	[Route("/Secteur/{CleSecteur}", HttpVerbs.Delete, Summary = "Supprime une ressource GenSecteur.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenSecteur spécifiée est introuvable.")]
	public partial class DeleteGenSecteur : IReturnVoid
	{
        /// <summary>
        /// Clé primaire. Immutable.
        /// </summary>
		[ApiMember(Description = "Clé primaire. Immutable.", DataType = SwaggerDataTypes.Int, ParameterType = SwaggerParamTypes.Path)]
        public int CleSecteur { get; set; }

	}
}
