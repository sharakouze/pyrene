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
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;

namespace Tmpi.Pyrene.ServiceModel.Types
{
	[CompositeIndex(true, "CleGenFourn", "LibObjet")]
	public partial class GenFournContact : IHasId<int>
	{
		[AutoIncrement]
		public int Id { get; set; }

		[ForeignKey(typeof(GenFourn), OnDelete = "CASCADE")]
		[Required]
		public int CleGenFourn { get; set; }

		[StringLength(100)]
		[Required]
		public string LibObjet { get; set; }

		[StringLength(500)]
		public string TxtObjet { get; set; }

		[StringLength(100)]
		public string PreContact { get; set; }

		[StringLength(25)]
		public string NumTelep { get; set; }

		[StringLength(25)]
		public string NumFax { get; set; }

		[StringLength(100)]
		public string NumEmail { get; set; }

		public TypGenre? TypGenre { get; set; }

		[StringLength(100)]
		public string CodFonction { get; set; }

	}
}
