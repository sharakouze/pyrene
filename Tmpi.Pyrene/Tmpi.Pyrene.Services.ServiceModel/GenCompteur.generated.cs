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
	[CompositeIndex(true, nameof(TypCompteur), nameof(CleSocieteProprietaire), nameof(CleSecteur), nameof(CleService))]
    [Route("/GenCompteur/{CodCompteur}", HttpVerbs.Post, Summary = "Ajoute une ressource GenCompteur.")]
    [Route("/GenCompteur/{CodCompteur}", HttpVerbs.Put, Summary = "Remplace une ressource GenCompteur.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenCompteur spécifiée est introuvable.")]
	public partial class GenCompteur : IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
        [IgnoreDataMember]
		public int CleCompteur { get; set; }

		/// <summary>
		/// Code unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public string CodCompteur { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibCompteur { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.", DataType = SwaggerDataTypes.String)]
		public string TxtCompteur { get; set; }

		/// <summary>
		/// Actif ou inactif.
		/// </summary>
		[Required]
		[ApiMember(Description = "Actif ou inactif.", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstActif { get; set; }

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
		/// Identifiant de synchronisation externe.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Identifiant de synchronisation externe.", DataType = SwaggerDataTypes.String)]
		public string CodExterne { get; set; }

		/// <summary>
		/// Périodicité.
		/// </summary>
		[Required]
		[ApiMember(Description = "Périodicité.", IsRequired = true)]
		[ApiAllowableValues(nameof(TypPeriodicite), typeof(TypPeriodicite))]
		public TypPeriodicite TypPeriodicite { get; set; }

		/// <summary>
		/// Type de compteur.
		/// </summary>
		[Required]
		[ApiMember(Description = "Type de compteur.", IsRequired = true)]
		[ApiAllowableValues(nameof(TypCompteur), typeof(TypCompteur))]
		public TypCompteur TypCompteur { get; set; }

		/// <summary>
		/// Société ayant accès au compteur, ou null pour toutes les sociétés.
		/// </summary>
		[References(typeof(GenSociete))]
        [IgnoreDataMember]
		public int? CleSocieteProprietaire { get; set; }

		/// <summary>
		/// Société ayant accès au compteur, ou null pour toutes les sociétés. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleSocieteProprietaire" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenSociete.CodSociete" />.
        /// </remarks>
		[ApiMember(Description = "Société ayant accès au compteur, ou null pour toutes les sociétés. Code unique.", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodSociete { get; set; }

		/// <summary>
		/// Secteur ayant accès au compteur, ou null pour tous les secteurs.
		/// </summary>
		[References(typeof(GenSecteur))]
        [IgnoreDataMember]
		public int? CleSecteur { get; set; }

		/// <summary>
		/// Secteur ayant accès au compteur, ou null pour tous les secteurs. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleSecteur" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenSecteur.CodSecteur" />.
        /// </remarks>
		[ApiMember(Description = "Secteur ayant accès au compteur, ou null pour tous les secteurs. Code unique.", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodSecteur { get; set; }

		/// <summary>
		/// Service ayant accès au compteur, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
        [IgnoreDataMember]
		public int? CleService { get; set; }

		/// <summary>
		/// Service ayant accès au compteur, ou null pour tous les services. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleService" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenService.CodService" />.
        /// </remarks>
		[ApiMember(Description = "Service ayant accès au compteur, ou null pour tous les services. Code unique.", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodService { get; set; }

		/// <summary>
		/// Format du modèle de numérotation.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Format du modèle de numérotation.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string ValFormatNumero { get; set; }

		[Reference]
		public List<GenCompteurValeur> LstValeur { get; set; }

	}
}
