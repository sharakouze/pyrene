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
	/// Retourne une ressource Profil (Personne).
	/// </summary>
	/// <seealso cref="GenPersonneProfil"/>
	[Route("/Personne/Profil/{CleProfil}", HttpVerbs.Get, Summary = "Retourne une ressource Profil (Personne).")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource Profil (Personne) ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Profil (Personne) spécifiée est introuvable.")]
	public partial class GetGenPersonneProfil : IReturn<GenPersonneProfil>, IGet
	{
        /// <summary>
        /// Identifiant unique de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleProfil { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public List<string> Fields { get; set; }
	}
}
