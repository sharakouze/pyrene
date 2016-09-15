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
	public partial class GenSecteur : IHasId<int>,
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

		[ForeignKey(typeof(GenSociete), OnDelete = "CASCADE")]
		[Required]
		[Index]
		[ApiMember()]
		public int CleGenSociete { get; set; }

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

	}
}
