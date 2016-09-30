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
    [Route("/GenSecteur", HttpVerbs.Post, Summary = "Ajoute une ressource GenSecteur.")]
    [Route("/GenSecteur/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenSecteur à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenSecteur spécifiée est introuvable.")]
	public partial class GenSecteur : IHasId<int>,
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
		/// Id de la société à laquelle appartient le secteur.
		/// </summary>
		[ForeignKey(typeof(GenSociete), OnDelete = "CASCADE")]
		[Required]
		[Index]
		[ApiMember(Description = "Id de la société à laquelle appartient le secteur.", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleGenSociete { get; set; }

		/// <summary>
		/// Rue.
		/// </summary>
		[StringLength(200)]
		[ApiMember(Description = "Rue.", DataType = SwaggerDataTypes.String)]
		public string AdrRue { get; set; }

		/// <summary>
		/// Code postal.
		/// </summary>
		[StringLength(10)]
		[ApiMember(Description = "Code postal.", DataType = SwaggerDataTypes.String)]
		public string AdrCode { get; set; }

		/// <summary>
		/// Ville ou commune.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Ville ou commune.", DataType = SwaggerDataTypes.String)]
		public string AdrCommune { get; set; }

		/// <summary>
		/// Pays.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Pays.", DataType = SwaggerDataTypes.String)]
		public string AdrPays { get; set; }

		/// <summary>
		/// Numéro de téléphone.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de téléphone.", DataType = SwaggerDataTypes.String)]
		public string NumTelep { get; set; }

		/// <summary>
		/// Numéro de fax.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de fax.", DataType = SwaggerDataTypes.String)]
		public string NumFax { get; set; }

		/// <summary>
		/// Adresse email.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Adresse email.", DataType = SwaggerDataTypes.String)]
		public string NumEmail { get; set; }

	}
}
