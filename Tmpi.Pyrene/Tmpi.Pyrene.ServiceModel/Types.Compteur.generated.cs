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

namespace Tmpi.Pyrene.ServiceModel.Types
{
	[Schema("Gen")]
	[CompositeIndex(true, nameof(TypCompteur), nameof(CleService))]
    [Route("/Compteur", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité Compteur à partir de son id")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité spécifiée est introuvable")]
    [ApiResponse(HttpStatusCode.Conflict, "L'entité spécifiée est un doublon")]
	public partial class Compteur : IReturn<Compteur>, IPost, IAuditable
	{
		/// <summary>
		/// Identifiant unique (immutable).
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique (immutable)", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleCompteur { get; set; }

		/// <summary>
		/// Code (unique).
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code (unique)", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodCompteur { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibCompteur { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description", DataType = SwaggerDataTypes.String)]
		public string TxtCompteur { get; set; }

		/// <summary>
		/// Actif ou inactif.
		/// </summary>
		[Required]
		[ApiMember(Description = "Actif ou inactif", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstActif { get; set; }

		/// <summary>
		/// Date de création (immutable).
		/// </summary>
		[Required]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur responsable de la création (immutable).
		/// </summary>
		[Required]
		public int CleCreateur { get; set; }

		/// <summary>
		/// Date de dernière modification (immutable).
		/// </summary>
		public DateTime? DatEdition { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur responsable de la dernière modification (immutable).
		/// </summary>
		public int? CleEditeur { get; set; }

		/// <summary>
		/// Identifiant de synchronisation externe.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Identifiant de synchronisation externe", DataType = SwaggerDataTypes.String)]
		public string CodExterne { get; set; }

		/// <summary>
		/// Périodicité.
		/// </summary>
		[Required]
		[ApiMember(Description = "Périodicité", IsRequired = true)]
		[ApiAllowableValues(nameof(TypPeriodicite), typeof(TypPeriodicite))]
		public TypPeriodicite TypPeriodicite { get; set; }

		/// <summary>
		/// Type de compteur.
		/// </summary>
		[Required]
		[ApiMember(Description = "Type de compteur", IsRequired = true)]
		[ApiAllowableValues(nameof(TypCompteur), typeof(TypCompteur))]
		public TypCompteur TypCompteur { get; set; }

		/// <summary>
		/// Identifiant unique du service ayant accès au compteur, ou null pour tous les services.
		/// </summary>
		[References(typeof(Service))]
		[ApiMember(Description = "Identifiant unique du service ayant accès au compteur, ou null pour tous les services", DataType = SwaggerDataTypes.Int)]
		public int? CleService { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="CleService"/>.
		/// </summary>
		[Reference]
		public Service Service { get; set; }

		/// <summary>
		/// Format du modèle de numérotation.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Format du modèle de numérotation", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string ValFormatNumero { get; set; }

		[Reference]
		public List<CompteurValeur> LstValeur { get; set; }

	}
}