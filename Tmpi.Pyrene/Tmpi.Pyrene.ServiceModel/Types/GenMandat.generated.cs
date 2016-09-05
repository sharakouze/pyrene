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
	[CompositeIndex(true, "TypMandat", "NivMandat")]
	[Route("/GenMandat", "POST", Summary = "Ajoute une entité GenMandat.")]
	[Route("/GenMandat/{Id}", "PUT", Summary = "Remplace une entité GenMandat.")]
	public partial class GenMandat : IHasId<int>,
		IAuditable,
		IHasCodLibTxt
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
		public TypMandat TypMandat { get; set; }

		[Required]
		public byte NivMandat { get; set; }

		[Required]
		public byte NbrSignature { get; set; }

		public string TxtMessage { get; set; }

	}
}
