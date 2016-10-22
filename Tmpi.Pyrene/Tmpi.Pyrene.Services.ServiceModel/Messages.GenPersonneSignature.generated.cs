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
	/// Retourne une collection des ressources Signature (Personne).
	/// </summary>
	/// <seealso cref="GenPersonneSignature"/>
	[Route("/Personne/{ClePersonne}/Signature", HttpVerbs.Get, Summary = "Retourne une collection des ressources Signature (Personne).")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class SelectGenPersonneSignature : IReturn<SelectGenPersonneSignatureResponse>, IGet
	{
        /// <summary>
        /// Identifiant unique de l'utilisateur parent
        /// </summary>
		[ApiMember(Description = "Identifiant unique de l'utilisateur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int ClePersonne { get; set; }

		public int? Skip { get; set; }

		public int? Take { get; set; }

		public string[] Sort { get; set; }
	}

    /// <summary>
    /// Réponse à la requête <see cref="SelectGenPersonneSignature"/>.
    /// </summary>
	public partial class SelectGenPersonneSignatureResponse
	{
		public ResponseStatus ResponseStatus { get; set; }

		public int TotalCount { get; set; }

		public List<GenPersonneSignature> Results { get; set; }
	}

	/// <summary>
	/// Retourne une ressource Signature (Personne) à partir de son id.
	/// </summary>
	/// <seealso cref="GenPersonneSignature"/>
	[Route("/Personne/Signature/{ClePersonne}", HttpVerbs.Get, Summary = "Retourne une ressource Signature (Personne) à partir de son id.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class GetGenPersonneSignature : IReturn<GenPersonneSignature>, IGet
	{
        /// <summary>
        /// Identifiant unique de la ressource à retourner.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à retourner.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int ClePersonne { get; set; }

        /// <summary>
        /// Champs à retourner, ou null pour retourner tous les champs.
        /// </summary>
        [ApiMember(Description = "Champs à retourner, ou null pour retourner tous les champs.", DataType = SwaggerDataTypes.ArrayOfString)]
        public string[] Fields { get; set; }
	}

	/// <summary>
	/// Supprime une ressource Signature (Personne) à partir de son id.
	/// </summary>
	/// <seealso cref="GenPersonneSignature"/>
	[Route("/Personne/Signature/{ClePersonne}", HttpVerbs.Delete, Summary = "Supprime une ressource Signature (Personne) à partir de son id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
	public partial class DeleteGenPersonneSignature : IReturnVoid, IDelete
	{
        /// <summary>
        /// Identifiant unique de la ressource à supprimer.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à supprimer.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int ClePersonne { get; set; }

	}

	/// <summary>
	/// Modifie partiellement une ressource Signature (Personne) à partir de son id.
	/// </summary>
	/// <seealso cref="GenPersonneSignature"/>
	[Route("/Personne/Signature/{ClePersonne}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource Signature (Personne) à partir de son id.")]
    [ApiResponse(HttpStatusCode.BadRequest, "La ressource ne contient pas tous les champs demandés.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable.")]
    [ApiResponse(HttpStatusCode.Conflict, "La ressource spécifiée est un doublon.")]
	public partial class PatchGenPersonneSignature : IReturnVoid, IPatch
	{
        /// <summary>
        /// Identifiant unique de la ressource à modifier.
        /// </summary>
		[ApiMember(Description = "Identifiant unique de la ressource à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int ClePersonne { get; set; }

        /// <summary>
        /// Liste des modifications à appliquer.
        /// </summary>
        [ApiMember(Description = "Liste des modifications à appliquer.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Form)]
        public Patch[] Fields { get; set; }
	}

}
