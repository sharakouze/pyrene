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
	[CompositeIndex(true, nameof(FournId), nameof(NomContact))]
	[Route("/Fourn/{Id}/Contact", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité FournContact à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité FournContact spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité FournContact spécifiée est introuvable")]
	public partial class FournContact : IHasId<int>, IAuditable, IReturn<FournContact>, IPost
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
		/// Identifiant unique du fournisseur parent.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="Fourn.Id"/>.
		/// </remarks>
		[ForeignKey(typeof(Fourn), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Identifiant unique du fournisseur parent", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int FournId { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="FournId"/>.
		/// </summary>
		[Reference]
		public Fourn Fourn { get; set; }

		/// <summary>
		/// Nom de famille.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Nom de famille", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string NomContact { get; set; }

		/// <summary>
		/// Prénom.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Prénom", DataType = SwaggerDataTypes.String)]
		public string PreContact { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(2000)]
		[ApiMember(Description = "Commentaire ou description", DataType = SwaggerDataTypes.String)]
		public string TxtContact { get; set; }

		/// <summary>
		/// Date de création (immutable).
		/// </summary>
		[Required]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification (immutable).
		/// </summary>
		public DateTime? DatModif { get; set; }

		/// <summary>
		/// Numéro de téléphone.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de téléphone", DataType = SwaggerDataTypes.String)]
		public string NumTelep { get; set; }

		/// <summary>
		/// Numéro de fax.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de fax", DataType = SwaggerDataTypes.String)]
		public string NumFax { get; set; }

		/// <summary>
		/// Adresse email.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Adresse email", DataType = SwaggerDataTypes.String)]
		public string NumEmail { get; set; }

		/// <summary>
		/// Titre de civilité.
		/// </summary>
		[ApiMember(Description = "Titre de civilité")]
		[ApiAllowableValues(nameof(TypCivilite), typeof(TypCivilite))]
		public TypCivilite? TypCivilite { get; set; }

		/// <summary>
		/// Fonction ou poste du contact chez le fournisseur.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Fonction ou poste du contact chez le fournisseur", DataType = SwaggerDataTypes.String)]
		public string LibFonction { get; set; }

	}
}
