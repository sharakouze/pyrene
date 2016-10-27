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
	/// Retourne une collection des entités <see cref="FournBanque"/>.
	/// </summary>
	[Route("/Fourn/{CleFourn}/Banque", HttpVerbs.Get, Summary = "Retourne une collection des entités FournBanque", Notes = SwaggerDescriptions.SelectRequestNotes)]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité FournBanque spécifiée est introuvable")]
	public partial class SelectFournBanque : IReturn<SelectFournBanqueResponse>, IGet, IPagination
	{
        /// <summary>
        /// Identifiant unique du fournisseur parent.
        /// </summary>
		[ApiMember(Description = "Identifiant unique du fournisseur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleFourn { get; set; }

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
		[ApiMember(Description = "Ordre de tri", DataType = SwaggerDataTypes.ArrayOfString)]
		public string[] Sort { get; set; }
	}

    /// <summary>
    /// Réponse à la requête <see cref="SelectFournBanque"/>.
    /// </summary>
	public partial class SelectFournBanqueResponse
	{
		public ResponseStatus ResponseStatus { get; set; }

		public int TotalCount { get; set; }

		public List<FournBanque> Results { get; set; }
	}

	/// <summary>
	/// Retourne une entité <see cref="FournBanque"/> à partir de son id.
	/// </summary>
	[Route("/Fourn/Banque/{CleBanque}", HttpVerbs.Get, Summary = "Retourne une entité FournBanque à partir de son id", Notes = SwaggerDescriptions.GetByIdRequestNotes)]
    [ApiResponse(HttpStatusCode.BadRequest, "L'entité FournBanque ne contient pas tous les champs demandés")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité FournBanque spécifiée est introuvable")]
	public partial class GetFournBanque : IReturn<FournBanque>, IGet
	{
        /// <summary>
        /// Identifiant unique de l'entité à retourner.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à retourner", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleBanque { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}

	/// <summary>
	/// Supprime une entité <see cref="FournBanque"/> à partir de son id.
	/// </summary>
	[Route("/Fourn/Banque/{CleBanque}", HttpVerbs.Delete, Summary = "Supprime une entité FournBanque à partir de son id", Notes = SwaggerDescriptions.DeleteByIdRequestNotes)]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité FournBanque spécifiée est introuvable")]
	public partial class DeleteFournBanque : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de l'entité à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à supprimer", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleBanque { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une entité <see cref="FournBanque"/> à partir de son id.
	/// </summary>
	[Route("/Fourn/Banque/{CleBanque}", HttpVerbs.Patch, Summary = "Modifie partiellement une entité FournBanque à partir de son id", Notes = SwaggerDescriptions.PatchByIdRequestNotes)]
    [ApiResponse(HttpStatusCode.BadRequest, "L'entité FournBanque ne contient pas tous les champs demandés")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité FournBanque spécifiée est introuvable")]
    [ApiResponse(HttpStatusCode.Conflict, "L'entité FournBanque spécifiée est un doublon")]
	public partial class PatchFournBanque : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de l'entité à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'entité à modifier", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleBanque { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}

}
