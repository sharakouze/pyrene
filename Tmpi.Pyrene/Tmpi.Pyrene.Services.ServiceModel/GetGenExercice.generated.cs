//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using System.Collections.Generic;
using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Retourne une ressource Exercice.
	/// </summary>
	/// <seealso cref="GenExercice"/>
	[Route("/Exercice/{CleExercice}", HttpVerbs.Get, Summary = "Retourne une ressource Exercice.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource Exercice ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Exercice spécifiée est introuvable.")]
	public partial class GetGenExercice : IReturn<GenExercice>, IGet
	{
        /// <summary>
        /// Identifiant unique de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleExercice { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public List<string> Fields { get; set; }
	}
}
