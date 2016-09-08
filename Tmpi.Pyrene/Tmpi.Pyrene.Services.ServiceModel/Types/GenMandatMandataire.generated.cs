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
	[CompositeIndex(true, "CleGenMandat", "CleGenPersonne", "CleGenSociete", "CleGenSecteur", "CleGenService")]
	public partial class GenMandatMandataire : IHasId<int>
	{
		[AutoIncrement]
		public int Id { get; set; }

		[ForeignKey(typeof(GenMandat), OnDelete = "CASCADE")]
		[Required]
		public int CleGenMandat { get; set; }

		[References(typeof(GenPersonne))]
		[Required]
		public int CleGenPersonne { get; set; }

		[References(typeof(GenSociete))]
		public int? CleGenSociete { get; set; }

		[References(typeof(GenSecteur))]
		public int? CleGenSecteur { get; set; }

		[References(typeof(GenService))]
		public int? CleGenService { get; set; }

		[Required]
		public bool EstSuspendu { get; set; }

	}
}
