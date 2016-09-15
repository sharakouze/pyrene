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
	public partial class GenPersonneSignature
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
		[PrimaryKey]
		[ApiMember(Description = "Clé primaire.")]
		public virtual int CleGenPersonne { get; set; }

		[Required]
		[ApiMember()]
		public virtual byte[] ImgSignature { get; set; }

		[StringLength(255)]
		[Required]
		[ApiMember()]
		public virtual string TypMime { get; set; }

	}
}
