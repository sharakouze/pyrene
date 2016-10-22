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
	/// Retourne une collection des ressources Valeur (Compteur).
	/// </summary>
	/// <seealso cref="GenCompteurValeur"/>
	[Route("/Compteur/{CleCompteur}/Valeur", HttpVerbs.Get, Summary = "Retourne une collection des ressources Valeur (Compteur).")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class SelectGenCompteurValeur : IReturn<SelectGenCompteurValeurResponse>, IGet
	{
        /// <summary>
        /// Identifiant unique du compteur parent
        /// </summary>
		[ApiMember(Description = "Identifiant unique du compteur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleCompteur { get; set; }

		public int? Skip { get; set; }

		public int? Take { get; set; }

		public string[] Sort { get; set; }
	}

    /// <summary>
    /// Réponse à la requête <see cref="SelectGenCompteurValeur"/>.
    /// </summary>
	public partial class SelectGenCompteurValeurResponse
	{
		public ResponseStatus ResponseStatus { get; set; }

		public int TotalCount { get; set; }

		public List<GenCompteurValeur> Results { get; set; }
	}

	/// <summary>
	/// Retourne une ressource Valeur (Compteur) à partir de son id.
	/// </summary>
	/// <seealso cref="GenCompteurValeur"/>
	[Route("/Compteur/Valeur/{CleValeur}", HttpVerbs.Get, Summary = "Retourne une ressource Valeur (Compteur) à partir de son id.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class GetGenCompteurValeur : IReturn<GenCompteurValeur>, IGet
	{
        /// <summary>
        /// Identifiant unique de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleValeur { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}

	/// <summary>
	/// Supprime une ressource Valeur (Compteur) à partir de son id.
	/// </summary>
	/// <seealso cref="GenCompteurValeur"/>
	[Route("/Compteur/Valeur/{CleValeur}", HttpVerbs.Delete, Summary = "Supprime une ressource Valeur (Compteur) à partir de son id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class DeleteGenCompteurValeur : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de la ressource à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleValeur { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une ressource Valeur (Compteur) à partir de son id.
	/// </summary>
	/// <seealso cref="GenCompteurValeur"/>
	[Route("/Compteur/Valeur/{CleValeur}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource Valeur (Compteur) à partir de son id.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
    [ApiResponse(HttpStatusCode.Conflict, "La ressource spécifiée est un doublon.")]
	public partial class PatchGenCompteurValeur : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de la ressource à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int CleValeur { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}

}
