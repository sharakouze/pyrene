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
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
	/// <summary>
	/// Retourne une collection des entités TVA.
	/// </summary>
	/// <seealso cref="TVA"/>
	[Route("/TVA", HttpVerbs.Get, Summary = "Retourne une collection des entités TVA")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité spécifiée est introuvable")]
	public partial class SelectTVA : IReturn<SelectTVAResponse>, IGet, IPagination
	{
        /// <summary>
        /// Nombre d'éléments à ignorer avant de retourner les éléments restants.
        /// </summary>
		[ApiMember(Description = "Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType = SwaggerDataTypes.Int)]
		public int? Skip { get; set; }

        /// <summary>
        /// Nombre d'éléments à retourner.
        /// </summary>
		[ApiMember(Description = "Nombre d'éléments à retourner", DataType = SwaggerDataTypes.Int)]
		public int? Take { get; set; }

        /// <summary>
        /// Tri.
        /// </summary>
		[ApiMember(Description = "Tri", DataType = SwaggerDataTypes.ArrayOfString)]
		public string[] Sort { get; set; }
	}

    /// <summary>
    /// Réponse à la requête <see cref="SelectTVA"/>.
    /// </summary>
	public partial class SelectTVAResponse
	{
		public ResponseStatus ResponseStatus { get; set; }

		public int TotalCount { get; set; }

		public List<TVA> Results { get; set; }
	}

	/// <summary>
	/// Retourne une entité TVA à partir de son id.
	/// </summary>
	/// <seealso cref="TVA"/>
	[Route("/TVA/{CleTVA}", HttpVerbs.Get, Summary = "Retourne une entité TVA à partir de son id")]
    [ApiResponse(HttpStatusCode.BadRequest, "L'entité ne contient pas tous les champs demandés")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité spécifiée est introuvable")]
	public partial class GetTVA : IReturn<TVA>, IGet
	{
        /// <summary>
        /// Identifiant unique de l'entité à retourner.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à retourner", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleTVA { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}

	/// <summary>
	/// Supprime une entité TVA à partir de son id.
	/// </summary>
	/// <seealso cref="TVA"/>
	[Route("/TVA/{CleTVA}", HttpVerbs.Delete, Summary = "Supprime une entité TVA à partir de son id")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité spécifiée est introuvable")]
	public partial class DeleteTVA : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de l'entité à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à supprimer", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleTVA { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une entité TVA à partir de son id.
	/// </summary>
	/// <seealso cref="TVA"/>
	[Route("/TVA/{CleTVA}", HttpVerbs.Patch, Summary = "Modifie partiellement une entité TVA à partir de son id")]
    [ApiResponse(HttpStatusCode.BadRequest, "L'entité ne contient pas tous les champs demandés")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité spécifiée est introuvable")]
    [ApiResponse(HttpStatusCode.Conflict, "L'entité spécifiée est un doublon")]
	public partial class PatchTVA : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de l'entité à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à modifier", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleTVA { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}

	/// <summary>
	/// Retourne le résultat d'une recherche sur les entités TVA.
	/// </summary>
	/// <seealso cref="TVA"/>
	[Route("/TVA/Recherche/{Text}", HttpVerbs.Get, Summary = "Retourne le résultat d'une recherche sur les entités TVA")]
	public partial class SearchTVA : IReturn<List<BaseEntity>>, IGet
	{
        /// <summary>
        /// Texte à rechercher.
        /// </summary>
        [ApiMember(Description = "Texte à rechercher", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public string Text { get; set; }

        /// <summary>
        /// Nombre maximum de résultats à retourner.
        /// </summary>
        [ApiMember(Description = "Nombre maximum de résultats à retourner", DataType = SwaggerDataTypes.Int)]
        public int Max { get; set; }
	}

}