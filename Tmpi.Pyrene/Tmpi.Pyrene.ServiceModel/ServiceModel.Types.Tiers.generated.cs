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
	[Route("/Tiers", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité Tiers à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité Tiers spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité Tiers spécifiée est introuvable")]
	public partial class Tiers : IHasId<int>, IAuditable, IReturn<Tiers>, IPost
	{
		/// <summary>
		/// Identifiant unique (immutable).
		/// </summary>
		/// <remarks>
		/// Clé primaire auto-incrémentée.
		/// </remarks>
		[AutoIncrement]
		[ApiMember(Description = "Identifiant unique (immutable)", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int Id { get; set; }

		/// <summary>
		/// Numéro interne. (unique).
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Numéro interne. (unique)", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string NumObjet { get; set; }

		/// <summary>
		/// Nom.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Nom", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string NomTiers { get; set; }

		[StringLength(2000)]
		[ApiMember(DataType = SwaggerDataTypes.String)]
		public string TxtObjet { get; set; }

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
		/// Date de dernière modification (immutable).
		/// </summary>
		[Required]
		public DateTime DatModif { get; set; }

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

		[DecimalLength(9, 6)]
		[ApiMember(DataType = SwaggerDataTypes.Decimal)]
		public decimal? AdrLatitude { get; set; }

		[DecimalLength(9, 6)]
		[ApiMember(DataType = SwaggerDataTypes.Decimal)]
		public decimal? AdrLongitude { get; set; }

		[StringLength(100)]
		[ApiMember(DataType = SwaggerDataTypes.String)]
		public string AdrCommuneSuite { get; set; }

		/// <summary>
		/// Code comptabilité.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Code comptabilité", DataType = SwaggerDataTypes.String)]
		public string CodCompta { get; set; }

		/// <summary>
		/// Identifiant unique du tiers établissement principal.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="Tiers.Id"/>.
		/// </remarks>
		[References(typeof(Tiers))]
		[ApiMember(Description = "Identifiant unique du tiers établissement principal", DataType = SwaggerDataTypes.Int)]
		public int? TiersPrincipalId { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="TiersPrincipalId"/>.
		/// </summary>
		[Reference]
		public Tiers TiersPrincipal { get; set; }

		/// <summary>
		/// Qualification.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="CiviliteTiers.Id"/>.
		/// </remarks>
		[References(typeof(CiviliteTiers))]
		[ApiMember(Description = "Qualification", DataType = SwaggerDataTypes.Int)]
		public int? CiviliteTiersId { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="CiviliteTiersId"/>.
		/// </summary>
		[Reference]
		public CiviliteTiers CiviliteTiers { get; set; }

		/// <summary>
		/// Critère 1.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="ProprieteTiers.Id"/>.
		/// </remarks>
		[References(typeof(ProprieteTiers))]
		[ApiMember(Description = "Critère 1", DataType = SwaggerDataTypes.Int)]
		public int? ProprieteTiers1Id { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="ProprieteTiers1Id"/>.
		/// </summary>
		[Reference]
		public ProprieteTiers ProprieteTiers1 { get; set; }

		/// <summary>
		/// Critère 2.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="ProprieteTiers.Id"/>.
		/// </remarks>
		[References(typeof(ProprieteTiers))]
		[ApiMember(Description = "Critère 2", DataType = SwaggerDataTypes.Int)]
		public int? ProprieteTiers2Id { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="ProprieteTiers2Id"/>.
		/// </summary>
		[Reference]
		public ProprieteTiers ProprieteTiers2 { get; set; }

		/// <summary>
		/// Critère 3.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="ProprieteTiers.Id"/>.
		/// </remarks>
		[References(typeof(ProprieteTiers))]
		[ApiMember(Description = "Critère 3", DataType = SwaggerDataTypes.Int)]
		public int? ProprieteTiers3Id { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="ProprieteTiers3Id"/>.
		/// </summary>
		[Reference]
		public ProprieteTiers ProprieteTiers3 { get; set; }

	}
}