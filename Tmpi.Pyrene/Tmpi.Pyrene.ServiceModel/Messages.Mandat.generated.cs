//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
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
	/// Retourne une collection des entités <see cref="Mandat"/>.
	/// </summary>
	[Route("/Mandat", HttpVerbs.Get, Summary = "Retourne une collection des entités Mandat", Notes = SwaggerDescriptions.SelectRequestNotes)]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité Mandat spécifiée est introuvable")]
	public partial class SelectMandat : IReturn<SelectMandatResponse>, IGet, IPagination
	{
		/// <summary>
		/// Champs à retourner, ou null pour retourner tous les champs.
		/// </summary>
		/// <example>
		/// CleCompteur,CodCompteur,LibCompteur,EstActif,Service(CodService,LibService)
		/// </example>
		[ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs", DataType = SwaggerDataTypes.String)]
		public string Fields { get; set; }

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
		/// Ordre de tri.
		/// </summary>
		/// <remarks>
		/// En préfixant le nom du champ avec le caractère moins (-) le tri sera descendant. Par défaut le tri est ascendant.
		/// </remarks>
		[ApiMember(Description = "Ordre de tri", DataType = SwaggerDataTypes.ArrayOfString)]
		public string[] Sort { get; set; }
	}

	/// <summary>
	/// Réponse à la requête <see cref="SelectMandat"/>.
	/// </summary>
	public partial class SelectMandatResponse
	{
		public ResponseStatus ResponseStatus { get; set; }

		public int TotalCount { get; set; }

		public List<Mandat> Results { get; set; }
	}

	/// <summary>
	/// Retourne une entité <see cref="Mandat"/> à partir de son id.
	/// </summary>
	[Route("/Mandat/{CleMandat}", HttpVerbs.Get, Summary = "Retourne une entité Mandat à partir de son id", Notes = SwaggerDescriptions.GetByIdRequestNotes)]
	[ApiResponse(HttpStatusCode.BadRequest, "L'entité Mandat ne contient pas tous les champs demandés")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité Mandat spécifiée est introuvable")]
	public partial class GetMandat : IReturn<Mandat>, IGet
	{
		/// <summary>
		/// Identifiant unique de l'entité à retourner.
		/// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à retourner", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleMandat { get; set; }

		/// <summary>
		/// Champs à retourner, ou null pour retourner tous les champs.
		/// </summary>
		[ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs", DataType = SwaggerDataTypes.String)]
		public string Fields { get; set; }
	}

	/// <summary>
	/// Supprime une entité <see cref="Mandat"/> à partir de son id.
	/// </summary>
	[Route("/Mandat/{CleMandat}", HttpVerbs.Delete, Summary = "Supprime une entité Mandat à partir de son id", Notes = SwaggerDescriptions.DeleteByIdRequestNotes)]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité Mandat spécifiée est introuvable")]
	public partial class DeleteMandat : IReturnVoid, IDelete
	{
		/// <summary>
		/// Identifiant unique de l'entité à supprimer.
		/// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à supprimer", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleMandat { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une entité <see cref="Mandat"/> à partir de son id.
	/// </summary>
	[Route("/Mandat/{CleMandat}", HttpVerbs.Patch, Summary = "Modifie partiellement une entité Mandat à partir de son id", Notes = SwaggerDescriptions.PatchByIdRequestNotes)]
	[ApiResponse(HttpStatusCode.BadRequest, "L'entité Mandat ne contient pas tous les champs demandés")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité Mandat spécifiée est introuvable")]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité Mandat spécifiée est un doublon")]
	public partial class PatchMandat : IReturnVoid, IPatch
	{
		/// <summary>
		/// Identifiant unique de l'entité à modifier.
		/// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à modifier", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleMandat { get; set; }

		/// <summary>
		/// Liste des modifications à appliquer.
		/// </summary>
		[ApiMember(Description = "Liste des modifications à appliquer", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
		public Patch[] Operations { get; set; }
	}

	/// <summary>
	/// Retourne le résultat d'une recherche sur les entités <see cref="Mandat"/>.
	/// </summary>
	[Route("/Mandat/Recherche/{Text}", HttpVerbs.Get, Summary = "Retourne le résultat d'une recherche sur les entités Mandat", Notes = SwaggerDescriptions.SearchRequestNotes)]
	public partial class SearchMandat : IReturn<List<BaseEntity>>, IGet
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
