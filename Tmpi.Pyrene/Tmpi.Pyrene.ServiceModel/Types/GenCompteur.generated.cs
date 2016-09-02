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
	[CompositeIndex(true, "TypCompteur", "CleGenSociete", "CleGenSecteur", "CleGenService")]
	public partial class GenCompteur : IHasId<int>
	{
		[AutoIncrement]
		public int Id { get; set; }

		[StringLength(100)]
		[Required]
		[Index(true)]
		public string CodObjet { get; set; }

		[StringLength(200)]
		[Required]
		[Index]
		public string LibObjet { get; set; }

		[StringLength(500)]
		public string TxtObjet { get; set; }

		[Required]
		public bool EstActif { get; set; }

		[Required]
		public DateTime DatCreation { get; set; }

		[Required]
		public DateTime DatModif { get; set; }

		[StringLength(100)]
		public string CodExterne { get; set; }

		[Required]
		public TypCompteur TypCompteur { get; set; }

		[References(typeof(GenSociete))]
		public int? CleGenSociete { get; set; }

		[References(typeof(GenSecteur))]
		public int? CleGenSecteur { get; set; }

		[References(typeof(GenService))]
		public int? CleGenService { get; set; }

		[Required]
		public TypPeriodicite TypPeriodicite { get; set; }

		[StringLength(25)]
		public string ValPrefixe1 { get; set; }

		[StringLength(25)]
		public string ValFormatDate1 { get; set; }

		[StringLength(25)]
		public string ValPrefixe2 { get; set; }

		[Required]
		public byte NbrDigit { get; set; }

		[StringLength(25)]
		public string ValSuffixe1 { get; set; }

		[StringLength(25)]
		public string ValFormatDate2 { get; set; }

		[StringLength(25)]
		public string ValSuffixe2 { get; set; }

		[StringLength(500)]
		public string LstFormatMois { get; set; }

	}
}