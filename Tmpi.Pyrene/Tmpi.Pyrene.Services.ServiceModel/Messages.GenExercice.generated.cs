//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using System;
using System.Collections.Generic;
using System.Net;
using System.Runtime.Serialization;
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.ServiceModel.Messages
{
	/// <summary>
	/// Retourne une collection des ressources Exercice.
	/// </summary>
	/// <seealso cref="GenExercice"/>
	[Route("/Exercice", HttpVerbs.Get, Summary = "Retourne une collection des ressources Exercice.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class SelectGenExercice : IReturn<SelectGenExerciceResponse>, IGet
	{
		public int? Skip { get; set; }

		public int? Take { get; set; }

		public string[] Sort { get; set; }
	}

	public partial class SelectGenExerciceResponse
	{
	}

	/// <summary>
	/// Retourne une ressource Exercice à partir de son id.
	/// </summary>
	/// <seealso cref="GenExercice"/>
	[Route("/Exercice/{CleExercice}", HttpVerbs.Get, Summary = "Retourne une ressource Exercice à partir de son id.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
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
        public string[] Fields { get; set; }
	}

	/// <summary>
	/// Supprime une ressource Exercice à partir de son id.
	/// </summary>
	/// <seealso cref="GenExercice"/>
	[Route("/Exercice/{CleExercice}", HttpVerbs.Delete, Summary = "Supprime une ressource Exercice à partir de son id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class DeleteGenExercice : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de la ressource à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleExercice { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une ressource Exercice à partir de son id.
	/// </summary>
	/// <seealso cref="GenExercice"/>
	[Route("/Exercice/{CleExercice}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource Exercice à partir de son id.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
    [ApiResponse(HttpStatusCode.Conflict, "La ressource spécifiée est un doublon.")]
	public partial class PatchGenExercice : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de la ressource à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleExercice { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}

	/// <summary>
	/// Retourne le résultat d'une recherche sur les ressources Exercice.
	/// </summary>
	/// <seealso cref="GenExercice"/>
	[Route("/Exercice/Recherche/{Text}", HttpVerbs.Get, Summary = "Retourne le résultat d'une recherche sur les ressources Exercice.")]
	public partial class SearchGenExercice : IReturn<List<BasicEntity>>, IGet
	{
        /// <summary>
        /// Texte à rechercher.
        /// </summary>
        [ApiMember(Description = "Texte à rechercher.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string Text { get; set; }

        /// <summary>
        /// Nombre maximum de résultats à retourner.
        /// </summary>
        [ApiMember(Description = "Nombre maximum de résultats à retourner.", DataType = SwaggerDataTypes.Int)]
        public int Max { get; set; }
	}

}
