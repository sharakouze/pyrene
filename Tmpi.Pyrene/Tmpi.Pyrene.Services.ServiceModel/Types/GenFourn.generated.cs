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
using Tmpi.Pyrene.Infrastructure.Types;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	public partial class GenFourn : IHasId<int>,
		IAuditable,
		IHasStandard
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.")]
		public int Id { get; set; }

		/// <summary>
		/// Code unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code unique.")]
		public string CodObjet { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation.")]
		public string LibObjet { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.")]
		public string TxtObjet { get; set; }

		/// <summary>
		/// Actif ou inactif.
		/// </summary>
		[Required]
		[ApiMember(Description = "Actif ou inactif.")]
		public bool EstActif { get; set; }

		/// <summary>
		/// Date de création.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de création.")]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de dernière modification.")]
		public DateTime DatModif { get; set; }

		/// <summary>
		/// Identifiant de synchronisation externe.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Identifiant de synchronisation externe.")]
		public string CodExterne { get; set; }

		[StringLength(200)]
		[ApiMember()]
		public string AdrRue { get; set; }

		[StringLength(10)]
		[ApiMember()]
		public string AdrCode { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string AdrVille { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string AdrPays { get; set; }

		[StringLength(25)]
		[ApiMember()]
		public string NumTelep { get; set; }

		[StringLength(25)]
		[ApiMember()]
		public string NumFax { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string NumEmail { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string CodCompta { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string NumClient { get; set; }

		[StringLength(25)]
		[ApiMember()]
		public string NumTVAIntra { get; set; }

		[DecimalLength(15, 2)]
		[ApiMember()]
		public decimal? MntFPort { get; set; }

		[DecimalLength(15, 2)]
		[ApiMember()]
		public decimal? MntFPortGratuit { get; set; }

		[DecimalLength(15, 2)]
		[ApiMember()]
		public decimal? MntCommandeMin { get; set; }

		[ApiMember()]
		public byte? DelLivraison { get; set; }

		[ApiMember()]
		public byte? DelPaiement { get; set; }

		[DecimalLength(5, 2)]
		[ApiMember()]
		public decimal? ValNote { get; set; }

		[ApiMember()]
		public TypModeReglement? TypModeReglement { get; set; }

		[Required]
		[ApiMember()]
		public bool EstEnvoiMailBonCde { get; set; }

		[References(typeof(GenPersonne))]
		[ApiMember()]
		public int? CleGenPersonne { get; set; }

		[Reference]
		public List<GenFournBanque> Banque { get; set; }

		[Reference]
		public List<GenFournContact> Contact { get; set; }

	}
}
