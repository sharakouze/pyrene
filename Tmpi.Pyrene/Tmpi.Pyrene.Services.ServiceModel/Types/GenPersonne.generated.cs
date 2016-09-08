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
	public partial class GenPersonne : IHasId<int>,
		IAuditable,
		IHasStandard
	{
		[AutoIncrement]
		[ApiMember(Description = "")]
		public int Id { get; set; }

		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "")]
		public string CodObjet { get; set; }

		[StringLength(100)]
		[Required]
		[Index]
		[ApiMember(Description = "")]
		public string LibObjet { get; set; }

		[StringLength(500)]
		[ApiMember(Description = "")]
		public string TxtObjet { get; set; }

		[Required]
		[ApiMember(Description = "")]
		public bool EstActif { get; set; }

		[Required]
		[ApiMember(Description = "")]
		public DateTime DatCreation { get; set; }

		[Required]
		[ApiMember(Description = "")]
		public DateTime DatModif { get; set; }

		[StringLength(100)]
		[ApiMember(Description = "")]
		public string CodExterne { get; set; }

		[StringLength(100)]
		[ApiMember(Description = "")]
		public string PrePersonne { get; set; }

		[ApiMember(Description = "")]
		public TypGenre? TypGenre { get; set; }

		[StringLength(25)]
		[ApiMember(Description = "")]
		public string NumTelep { get; set; }

		[StringLength(25)]
		[ApiMember(Description = "")]
		public string NumFax { get; set; }

		[StringLength(100)]
		[ApiMember(Description = "")]
		public string NumEmail { get; set; }

		[Reference]
		public List<GenPersonneProfil> Profil { get; set; }

		[Reference]
		public GenPersonneSignature Signature { get; set; }

	}
}
