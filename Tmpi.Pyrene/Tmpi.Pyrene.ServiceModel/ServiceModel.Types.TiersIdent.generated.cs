//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

#pragma warning disable 1591

using System;
using System.Collections.Generic;
using System.Net;
using System.Runtime.Serialization;
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;

namespace Tmpi.Pyrene.ServiceModel.Types
{
	[Schema("Gen")]
	[CompositeIndex(true, nameof(TiersId), nameof(TypeIdentId))]
	[Route("/Tiers/{Id}/Ident", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité TiersIdent à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité TiersIdent spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité TiersIdent spécifiée est introuvable")]
	public partial class TiersIdent : IHasId<int>, IReturn<TiersIdent>, IPost
	{
		/// <summary>
		/// Identifiant unique (immutable).
		/// </summary>
		/// <remarks>
		/// Clé primaire auto-incrémentée.
		/// </remarks>
		[AutoIncrement]
		[ApiMember(Description = "Identifiant unique (immutable)", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int Id { get; set; }

		/// <summary>
		/// Identifiant unique du tiers parent.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="Tiers.Id"/>.
		/// </remarks>
		[ForeignKey(typeof(Tiers), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Identifiant unique du tiers parent", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int TiersId { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="TiersId"/>.
		/// </summary>
		[Reference]
		public Tiers Tiers { get; set; }

		/// <summary>
		/// Identifiant unique du type d'identifiant.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="TypeIdent.Id"/>.
		/// </remarks>
		[References(typeof(TypeIdent))]
		[Required]
		[ApiMember(Description = "Identifiant unique du type d'identifiant", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int TypeIdentId { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="TypeIdentId"/>.
		/// </summary>
		[Reference]
		public TypeIdent TypeIdent { get; set; }

		/// <summary>
		/// Numéro de l'identifiant.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Numéro de l'identifiant", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string NumIdent { get; set; }

	}
}
