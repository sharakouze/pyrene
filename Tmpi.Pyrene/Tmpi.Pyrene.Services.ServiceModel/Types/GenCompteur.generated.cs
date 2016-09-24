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
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	[CompositeIndex(true, "TypCompteur", "CleGenSociete", "CleGenSecteur", "CleGenService")]
	public partial class GenCompteur : IHasId<int>,
		IEntity,
		IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerType.Int)]
		public int Id { get; set; }

		/// <summary>
		/// Code unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code unique.", IsRequired = true, DataType = SwaggerType.String)]
		public string CodObjet { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation.", IsRequired = true, DataType = SwaggerType.String)]
		public string LibObjet { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.", DataType = SwaggerType.String)]
		public string TxtObjet { get; set; }

		/// <summary>
		/// Actif ou inactif.
		/// </summary>
		[Required]
		[ApiMember(Description = "Actif ou inactif.", IsRequired = true, DataType = SwaggerType.Boolean)]
		public bool EstActif { get; set; }

		/// <summary>
		/// Date de création.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de création.", IsRequired = true, DataType = SwaggerType.Date)]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de dernière modification.", IsRequired = true, DataType = SwaggerType.Date)]
		public DateTime DatModif { get; set; }

		/// <summary>
		/// Identifiant de synchronisation externe.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Identifiant de synchronisation externe.", DataType = SwaggerType.String)]
		public string CodExterne { get; set; }

		/// <summary>
		/// Type de compteur.
		/// </summary>
		[Required]
		[ApiMember(Description = "Type de compteur.", IsRequired = true)]
		[ApiAllowableValues("TypCompteur", typeof(TypCompteur))]
		public TypCompteur TypCompteur { get; set; }

		/// <summary>
		/// Périodicité.
		/// </summary>
		[Required]
		[ApiMember(Description = "Périodicité.", IsRequired = true)]
		[ApiAllowableValues("TypPeriodicite", typeof(TypPeriodicite))]
		public TypPeriodicite TypPeriodicite { get; set; }

		/// <summary>
		/// Id de la société associée.
		/// </summary>
		[References(typeof(GenSociete))]
		[ApiMember(Description = "Id de la société associée.", DataType = SwaggerType.Int)]
		public int? CleGenSociete { get; set; }

		/// <summary>
		/// Id du secteur associé.
		/// </summary>
		[References(typeof(GenSecteur))]
		[ApiMember(Description = "Id du secteur associé.", DataType = SwaggerType.Int)]
		public int? CleGenSecteur { get; set; }

		/// <summary>
		/// Id du service associé.
		/// </summary>
		[References(typeof(GenService))]
		[ApiMember(Description = "Id du service associé.", DataType = SwaggerType.Int)]
		public int? CleGenService { get; set; }

		/// <summary>
		/// Format du modèle de numérotation.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Format du modèle de numérotation.", IsRequired = true, DataType = SwaggerType.String)]
		public string ValFormatNumero { get; set; }

		[StringLength(500)]
		[ApiMember(DataType = SwaggerType.String)]
		public string LstFormatMois { get; set; }

		[Reference]
		public List<GenCompteurValeur> LstValeur { get; set; }

	}
}
