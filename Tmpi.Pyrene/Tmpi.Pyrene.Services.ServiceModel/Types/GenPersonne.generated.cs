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
using Tmpi.Pyrene.Infrastructure.Types;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	[Route("/GenPersonne", "POST", Summary = "Ajoute une entité GenPersonne.")]
	[Route("/GenPersonne/{Id}", "PUT", Summary = "Remplace une entité GenPersonne à partir de son Id.")]
	public partial class GenPersonne : IHasId<int>,
		IAuditable,
		IHasStandard
	{
		[AutoIncrement]
		public int Id { get; set; }

		[StringLength(100)]
		[Required]
		[Index(true)]
		public string CodObjet { get; set; }

		[StringLength(100)]
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

		[StringLength(100)]
		public string PrePersonne { get; set; }

		public TypGenre? TypGenre { get; set; }

		[StringLength(25)]
		public string NumTelep { get; set; }

		[StringLength(25)]
		public string NumFax { get; set; }

		[StringLength(100)]
		public string NumEmail { get; set; }

	}
}
