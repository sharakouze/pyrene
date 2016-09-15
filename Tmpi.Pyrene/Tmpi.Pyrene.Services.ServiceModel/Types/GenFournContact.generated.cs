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
	[CompositeIndex(true, "CleGenFourn", "LibObjet")]
	public partial class GenFournContact : IHasId<int>
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.")]
		public int Id { get; set; }

		[ForeignKey(typeof(GenFourn), OnDelete = "CASCADE")]
		[Required]
		[ApiMember()]
		public int CleGenFourn { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Désignation.")]
		public string LibObjet { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.")]
		public string TxtObjet { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string PreContact { get; set; }

		[StringLength(25)]
		[ApiMember()]
		public string NumTelep { get; set; }

		[StringLength(25)]
		[ApiMember()]
		public string NumFax { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string NumEmail { get; set; }

		[ApiMember()]
		public TypGenre? TypGenre { get; set; }

		[StringLength(100)]
		[ApiMember()]
		public string CodFonction { get; set; }

	}
}
