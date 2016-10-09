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

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	[CompositeIndex(true, nameof(ClePersonne), nameof(CleSociete), nameof(CleSecteur), nameof(CleService))]
	[CompositeIndex(true, nameof(CodProfil), nameof(ClePersonne))]
    [Route("/Personne/{CodPersonne}/Profil/{CodProfil}", HttpVerbs.Post, Summary = "Ajoute une ressource GenPersonneProfil.")]
    [Route("/Personne/{CodPersonne}/Profil/{CodProfil}", HttpVerbs.Put, Summary = "Remplace une ressource GenPersonneProfil.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	public partial class GenPersonneProfil : IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
        [IgnoreDataMember]
		public int CleProfil { get; set; }

		/// <summary>
		/// Utilisateur parent.
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
        [IgnoreDataMember]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Utilisateur parent. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="ClePersonne" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenPersonne.CodPersonne" />.
        /// </remarks>
		[ApiMember(Description = "Utilisateur parent. Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		[Ignore]
		public string CodPersonne { get; set; }

		/// <summary>
		/// Code.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodProfil { get; set; }

		/// <summary>
		/// Date de création.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de création.", DataType = SwaggerDataTypes.DateTime)]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de dernière modification.", DataType = SwaggerDataTypes.DateTime)]
		public DateTime DatModif { get; set; }

		/// <summary>
		/// Société à laquelle a accès le profil, ou null pour toutes les sociétés.
		/// </summary>
		[References(typeof(GenSociete))]
        [IgnoreDataMember]
		public int? CleSociete { get; set; }

		/// <summary>
		/// Société à laquelle a accès le profil, ou null pour toutes les sociétés. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleSociete" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenSociete.CodSociete" />.
        /// </remarks>
		[ApiMember(Description = "Société à laquelle a accès le profil, ou null pour toutes les sociétés. Code unique.", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodSociete { get; set; }

		/// <summary>
		/// Secteur auquel a accès le profil, ou null pour tous les secteurs.
		/// </summary>
		[References(typeof(GenSecteur))]
        [IgnoreDataMember]
		public int? CleSecteur { get; set; }

		/// <summary>
		/// Secteur auquel a accès le profil, ou null pour tous les secteurs. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleSecteur" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenSecteur.CodSecteur" />.
        /// </remarks>
		[ApiMember(Description = "Secteur auquel a accès le profil, ou null pour tous les secteurs. Code unique.", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodSecteur { get; set; }

		/// <summary>
		/// Service auquel a accès le profil, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
        [IgnoreDataMember]
		public int? CleService { get; set; }

		/// <summary>
		/// Service auquel a accès le profil, ou null pour tous les services. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleService" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenService.CodService" />.
        /// </remarks>
		[ApiMember(Description = "Service auquel a accès le profil, ou null pour tous les services. Code unique.", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodService { get; set; }

	}
}
