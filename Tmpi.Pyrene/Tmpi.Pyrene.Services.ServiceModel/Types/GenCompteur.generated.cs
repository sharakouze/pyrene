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
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	[CompositeIndex(true, nameof(TypCompteur), nameof(CleGenSociete), nameof(CleGenSecteur), nameof(CleGenService))]
    [Route("/GenCompteur", HttpVerbs.Post, Summary = "Ajoute une ressource GenCompteur.")]
    [Route("/GenCompteur/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenCompteur à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenCompteur spécifiée est introuvable.")]
	public partial class GenCompteur : IHasId<int>,
		IEntity,
		IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Post)]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Put, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
		public int Id { get; set; }

		/// <summary>
		/// Code unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodObjet { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibObjet { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.", DataType = SwaggerDataTypes.String)]
		public string TxtObjet { get; set; }

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
		/// Id de la société ayant accès au compteur, ou null pour toutes les sociétés.
		/// </summary>
		[References(typeof(GenSociete))]
		[ApiMember(Description = "Id de la société ayant accès au compteur, ou null pour toutes les sociétés.", DataType = SwaggerDataTypes.Int)]
		public int? CleGenSociete { get; set; }

		/// <summary>
		/// Id du secteur ayant accès au compteur, ou null pour tous les secteurs.
		/// </summary>
		[References(typeof(GenSecteur))]
		[ApiMember(Description = "Id du secteur ayant accès au compteur, ou null pour tous les secteurs.", DataType = SwaggerDataTypes.Int)]
		public int? CleGenSecteur { get; set; }

		/// <summary>
		/// Id du service ayant accès au compteur, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
		[ApiMember(Description = "Id du service ayant accès au compteur, ou null pour tous les services.", DataType = SwaggerDataTypes.Int)]
		public int? CleGenService { get; set; }

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
