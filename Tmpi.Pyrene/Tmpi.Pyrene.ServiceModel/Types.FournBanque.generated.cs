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
	[CompositeIndex(true, nameof(CleFourn), nameof(CodIBAN))]
	[Route("/Fourn/{CleFourn}/Banque", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité FournBanque à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité FournBanque spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité FournBanque spécifiée est introuvable")]
	public partial class FournBanque : IReturn<FournBanque>, IPost, IAuditable
	{
		/// <summary>
		/// Identifiant unique (immutable).
		/// </summary>
		/// <remarks>
		/// Clé primaire auto-incrémentée.
		/// </remarks>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique (immutable)", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleBanque { get; set; }

		/// <summary>
		/// Identifiant unique du fournisseur parent.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="Fourn.CleFourn"/>.
		/// </remarks>
		[ForeignKey(typeof(Fourn), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Identifiant unique du fournisseur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleFourn { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="CleFourn"/>.
		/// </summary>
		[Reference]
		public Fourn Fourn { get; set; }

		/// <summary>
		/// Code IBAN.
		/// </summary>
		[StringLength(34)]
		[Required]
		[ApiMember(Description = "Code IBAN", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodIBAN { get; set; }

		/// <summary>
		/// Code BIC.
		/// </summary>
		[StringLength(11)]
		[Required]
		[ApiMember(Description = "Code BIC", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodBIC { get; set; }

		/// <summary>
		/// Nom de l'établissement bancaire.
		/// </summary>
		[StringLength(200)]
		[Required]
		[ApiMember(Description = "Nom de l'établissement bancaire", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibEtablissement { get; set; }

		/// <summary>
		/// Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur.
		/// </summary>
		[Required]
		[ApiMember(Description = "Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstDefaut { get; set; }

		/// <summary>
		/// Date de création (immutable).
		/// </summary>
		[Required]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur responsable de la création (immutable).
		/// </summary>
		[Required]
		public int CleCreateur { get; set; }

		/// <summary>
		/// Date de dernière modification (immutable).
		/// </summary>
		public DateTime? DatEdition { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur responsable de la dernière modification (immutable).
		/// </summary>
		public int? CleEditeur { get; set; }

	}
}
