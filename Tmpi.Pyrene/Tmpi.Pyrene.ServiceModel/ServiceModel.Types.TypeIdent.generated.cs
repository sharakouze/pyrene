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
	[Route("/TypeIdent", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité TypeIdent à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité TypeIdent spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité TypeIdent spécifiée est introuvable")]
	public partial class TypeIdent : IHasId<int>, IAuditable, IReturn<TypeIdent>, IPost
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
		/// (unique).
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "(unique)", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodObjet { get; set; }

		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibObjet { get; set; }

		[StringLength(2000)]
		[ApiMember(DataType = SwaggerDataTypes.String)]
		public string TxtObjet { get; set; }

		/// <summary>
		/// Actif ou inactif.
		/// </summary>
		[Required]
		[ApiMember(Description = "Actif ou inactif", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstActif { get; set; }

		/// <summary>
		/// Date de création (immutable).
		/// </summary>
		[Required]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification (immutable).
		/// </summary>
		[Required]
		public DateTime DatModif { get; set; }

		/// <summary>
		/// Identifiant de synchronisation externe.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Identifiant de synchronisation externe", DataType = SwaggerDataTypes.String)]
		public string CodExterne { get; set; }

	}
}
