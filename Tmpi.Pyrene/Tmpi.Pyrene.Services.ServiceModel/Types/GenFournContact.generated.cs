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
using System.Net;
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	[CompositeIndex(true, nameof(CleGenFourn), nameof(NomContact))]
    [Route("/GenFourn/Contact", HttpVerbs.Post, Summary = "Ajoute une ressource GenFournContact.")]
    [Route("/GenFourn/Contact/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenFournContact à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournContact spécifiée est introuvable.")]
	public partial class GenFournContact : IHasId<int>,
		IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Integer, Verb = HttpVerbs.Post, ParameterType = SwaggerParameterTypes.Form)]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Integer, IsRequired = true, Verb = HttpVerbs.Put, ParameterType = SwaggerParameterTypes.Path)]
		public int Id { get; set; }

		/// <summary>
		/// Id du fournisseur parent.
		/// </summary>
		[ForeignKey(typeof(GenFourn), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Id du fournisseur parent.", DataType = SwaggerDataTypes.Integer, IsRequired = true)]
		public int CleGenFourn { get; set; }

		/// <summary>
		/// Nom de famille.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Nom de famille.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string NomContact { get; set; }

		/// <summary>
		/// Prénom.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Prénom.", DataType = SwaggerDataTypes.String)]
		public string PreContact { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.", DataType = SwaggerDataTypes.String)]
		public string TxtObjet { get; set; }

		/// <summary>
		/// Date de création.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de création.", DataType = SwaggerDataTypes.Date)]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de dernière modification.", DataType = SwaggerDataTypes.Date)]
		public DateTime DatModif { get; set; }

		/// <summary>
		/// Numéro de téléphone.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de téléphone.", DataType = SwaggerDataTypes.String)]
		public string NumTelep { get; set; }

		/// <summary>
		/// Numéro de fax.
		/// </summary>
		[StringLength(25)]
		[ApiMember(Description = "Numéro de fax.", DataType = SwaggerDataTypes.String)]
		public string NumFax { get; set; }

		/// <summary>
		/// Adresse email.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Adresse email.", DataType = SwaggerDataTypes.String)]
		public string NumEmail { get; set; }

		/// <summary>
		/// Titre de civilité.
		/// </summary>
		[ApiMember(Description = "Titre de civilité.")]
		[ApiAllowableValues(nameof(TypCivilite), typeof(TypCivilite))]
		public TypCivilite? TypCivilite { get; set; }

		/// <summary>
		/// Fonction ou poste du contact chez le fournisseur.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Fonction ou poste du contact chez le fournisseur.", DataType = SwaggerDataTypes.String)]
		public string LibFonction { get; set; }

	}
}
