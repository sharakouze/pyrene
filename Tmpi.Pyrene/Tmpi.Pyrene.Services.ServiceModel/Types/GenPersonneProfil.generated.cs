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
	[CompositeIndex(true, "CleGenPersonne", "CleGenSociete", "CleGenSecteur", "CleGenService")]
	[CompositeIndex(true, "CodObjet", "CleGenPersonne")]
	public partial class GenPersonneProfil : IHasId<int>
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.")]
		public virtual int Id { get; set; }

		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
		[ApiMember()]
		public virtual int CleGenPersonne { get; set; }

		/// <summary>
		/// Code unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Code unique.")]
		public virtual string CodObjet { get; set; }

		[References(typeof(GenSociete))]
		[ApiMember()]
		public virtual int? CleGenSociete { get; set; }

		[References(typeof(GenSecteur))]
		[ApiMember()]
		public virtual int? CleGenSecteur { get; set; }

		[References(typeof(GenService))]
		[ApiMember()]
		public virtual int? CleGenService { get; set; }

	}
}