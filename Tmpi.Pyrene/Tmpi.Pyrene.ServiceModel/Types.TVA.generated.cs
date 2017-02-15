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

namespace Tmpi.Pyrene.ServiceModel.Types
{
	[Schema("Gen")]
	[Route("/TVA", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité TVA à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité TVA spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité TVA spécifiée est introuvable")]
	public partial class TVA : IReturn<TVA>, IPost, IAuditable
	{
		/// <summary>
		/// Identifiant unique (immutable).
		/// </summary>
		/// <remarks>
		/// Clé primaire auto-incrémentée.
		/// </remarks>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique (immutable)", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleTVA { get; set; }

		/// <summary>
		/// Code (unique).
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code (unique)", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodTVA { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibTVA { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description", DataType = SwaggerDataTypes.String)]
		public string TxtTVA { get; set; }

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
		/// Taux de TVA.
		/// </summary>
		[DecimalLength(5, 2)]
		[Required]
		[ApiMember(Description = "Taux de TVA", DataType = SwaggerDataTypes.Decimal, IsRequired = true)]
		public decimal TauTVA { get; set; }

	}
}
