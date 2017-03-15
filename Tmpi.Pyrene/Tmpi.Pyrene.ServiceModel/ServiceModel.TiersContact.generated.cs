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

namespace Tmpi.Pyrene.ServiceModel
{
	/// <summary>
	/// Retourne une collection des entités <see cref="TiersContact"/>.
	/// </summary>
	[Route("/Tiers/{TiersId}/Contact", HttpVerbs.Get, Summary = "Retourne une collection des entités TiersContact", Notes = SwaggerDescriptions.SelectRequestNotes)]
	[ApiResponse(HttpStatusCode.BadRequest, "L'entité TiersContact ne contient pas tous les champs demandés")]
	public partial class SelectTiersContact : IReturn<SelectTiersContactResponse>, IGet
	{
		/// <summary>
		/// Identifiant unique du tiers parent.
		/// </summary>
		[ApiMember(Description = "Identifiant unique du tiers parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int TiersId { get; set; }

		/// <summary>
		/// Champs à retourner, ou null pour retourner tous les champs.
		/// </summary>
		/// <example>
		/// Id,CodCompteur,LibCompteur,EstActif,Service(CodService,LibService)
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
		/// En préfixant le nom du champ avec le caractère moins (-) le tri sera descendant.
		/// Par défaut le tri est ascendant.
		/// </remarks>
		[ApiMember(Description = "Ordre de tri", DataType = SwaggerDataTypes.ArrayOfString)]
		public string[] Sort { get; set; }
	}

	/// <summary>
	/// Réponse à la requête <see cref="SelectTiersContact"/>.
	/// </summary>
	public partial class SelectTiersContactResponse : IHasResponseStatus
	{
		/// <summary>
		/// Détail de l'erreur éventuelle.
		/// </summary>
		public ResponseStatus ResponseStatus { get; set; }

		/// <summary>
		/// Nombre total d'éléments disponibles.
		/// </summary>
		public int TotalCount { get; set; }

		/// <summary>
		/// Collection des entités <see cref="TiersContact"/>.
		/// </summary>
		public List<TiersContact> Results { get; set; }
	}

	/// <summary>
	/// Retourne une entité <see cref="TiersContact"/> à partir de son id.
	/// </summary>
	[Route("/Tiers/Contact/{Id}", HttpVerbs.Get, Summary = "Retourne une entité TiersContact à partir de son id", Notes = SwaggerDescriptions.GetByIdRequestNotes)]
	[ApiResponse(HttpStatusCode.BadRequest, "L'entité TiersContact ne contient pas tous les champs demandés")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité TiersContact spécifiée est introuvable")]
	public partial class GetTiersContact : IReturn<TiersContact>, IGet
	{
		/// <summary>
		/// Identifiant unique de l'entité à retourner.
		/// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à retourner", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int Id { get; set; }

		/// <summary>
		/// Champs à retourner, ou null pour retourner tous les champs.
		/// </summary>
		[ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs", DataType = SwaggerDataTypes.String)]
		public string Fields { get; set; }
	}

	/// <summary>
	/// Supprime une entité <see cref="TiersContact"/> à partir de son id.
	/// </summary>
	[Route("/Tiers/Contact/{Id}", HttpVerbs.Delete, Summary = "Supprime une entité TiersContact à partir de son id", Notes = SwaggerDescriptions.DeleteByIdRequestNotes)]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité TiersContact spécifiée est introuvable")]
	public partial class DeleteTiersContact : IReturnVoid, IDelete
	{
		/// <summary>
		/// Identifiant unique de l'entité à supprimer.
		/// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à supprimer", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int Id { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une entité <see cref="TiersContact"/> à partir de son id.
	/// </summary>
	[Route("/Tiers/Contact/{Id}", HttpVerbs.Patch, Summary = "Modifie partiellement une entité TiersContact à partir de son id", Notes = SwaggerDescriptions.PatchByIdRequestNotes)]
	[ApiResponse(HttpStatusCode.BadRequest, "L'entité TiersContact ne contient pas tous les champs demandés")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité TiersContact spécifiée est introuvable")]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité TiersContact spécifiée est un doublon")]
	public partial class PatchTiersContact : IReturnVoid, IPatch
	{
		/// <summary>
		/// Identifiant unique de l'entité à modifier.
		/// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à modifier", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int Id { get; set; }

		/// <summary>
		/// Liste des modifications à appliquer.
		/// </summary>
		[ApiMember(Description = "Liste des modifications à appliquer", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
		public Patch[] Operations { get; set; }
	}

}