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
	[Route("/Fourn", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité Fourn à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité Fourn spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité Fourn spécifiée est introuvable")]
	public partial class Fourn : IReturn<Fourn>, IPost, IAuditable
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
		public int CleFourn { get; set; }

		/// <summary>
		/// Code (unique).
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code (unique)", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodFourn { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibFourn { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description", DataType = SwaggerDataTypes.String)]
		public string TxtFourn { get; set; }

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
		/// Rue.
		/// </summary>
		[StringLength(200)]
		[ApiMember(Description = "Rue", DataType = SwaggerDataTypes.String)]
		public string AdrRue { get; set; }

		/// <summary>
		/// Code postal.
		/// </summary>
		[StringLength(10)]
		[ApiMember(Description = "Code postal", DataType = SwaggerDataTypes.String)]
		public string AdrCode { get; set; }

		/// <summary>
		/// Ville ou commune.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Ville ou commune", DataType = SwaggerDataTypes.String)]
		public string AdrCommune { get; set; }

		/// <summary>
		/// Pays.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Pays", DataType = SwaggerDataTypes.String)]
		public string AdrPays { get; set; }

		/// <summary>
		/// Numéro de téléphone.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de téléphone", DataType = SwaggerDataTypes.String)]
		public string NumTelep { get; set; }

		/// <summary>
		/// Numéro de fax.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de fax", DataType = SwaggerDataTypes.String)]
		public string NumFax { get; set; }

		/// <summary>
		/// Adresse email.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Adresse email", DataType = SwaggerDataTypes.String)]
		public string NumEmail { get; set; }

		/// <summary>
		/// Code comptabilité.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Code comptabilité", DataType = SwaggerDataTypes.String)]
		public string CodCompta { get; set; }

		/// <summary>
		/// Numéro de client.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Numéro de client", DataType = SwaggerDataTypes.String)]
		public string NumClient { get; set; }

		/// <summary>
		/// Numéro de TVA intracommunautaire.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de TVA intracommunautaire", DataType = SwaggerDataTypes.String)]
		public string NumTVAIntra { get; set; }

		/// <summary>
		/// Frais de port.
		/// </summary>
		[DecimalLength(15, 2)]
		[ApiMember(Description = "Frais de port", DataType = SwaggerDataTypes.Decimal)]
		public decimal? MntFPort { get; set; }

		/// <summary>
		/// Montant minimum pour frais de port gratuits.
		/// </summary>
		[DecimalLength(15, 2)]
		[ApiMember(Description = "Montant minimum pour frais de port gratuits", DataType = SwaggerDataTypes.Decimal)]
		public decimal? MntFPortGratuit { get; set; }

		/// <summary>
		/// Montant minimum à commander.
		/// </summary>
		[DecimalLength(15, 2)]
		[ApiMember(Description = "Montant minimum à commander", DataType = SwaggerDataTypes.Decimal)]
		public decimal? MntCommandeMin { get; set; }

		/// <summary>
		/// Délais de livraison en jours.
		/// </summary>
		[ApiMember(Description = "Délais de livraison en jours", DataType = SwaggerDataTypes.Byte)]
		public byte? DelLivraison { get; set; }

		/// <summary>
		/// Délais de paiement en jours.
		/// </summary>
		[ApiMember(Description = "Délais de paiement en jours", DataType = SwaggerDataTypes.Byte)]
		public byte? DelPaiement { get; set; }

		/// <summary>
		/// Note globale.
		/// </summary>
		[DecimalLength(5, 2)]
		[ApiMember(Description = "Note globale", DataType = SwaggerDataTypes.Decimal)]
		public decimal? ValNote { get; set; }

		/// <summary>
		/// Mode de règlement.
		/// </summary>
		[ApiMember(Description = "Mode de règlement")]
		[ApiAllowableValues(nameof(TypModeReglement), typeof(TypModeReglement))]
		public TypModeReglement? TypModeReglement { get; set; }

		[Required]
		[ApiMember(DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstEnvoiMailBonCde { get; set; }

	}
}
