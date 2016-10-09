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
using System.Runtime.Serialization;
using ServiceStack;
using ServiceStack.DataAnnotations;
using ServiceStack.Model;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
	[CompositeIndex(true, nameof(CleFourn), nameof(NomContact))]
    [Route("/Fourn/{CodFourn}/Contact/{NomContact}", HttpVerbs.Post, Summary = "Ajoute une ressource GenFournContact.")]
    [Route("/Fourn/{CodFourn}/Contact/{NomContact}", HttpVerbs.Put, Summary = "Remplace une ressource GenFournContact.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournContact spécifiée est introuvable.")]
	public partial class GenFournContact : IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
        [IgnoreDataMember]
		public int CleContact { get; set; }

		/// <summary>
		/// Fournisseur parent.
		/// </summary>
		[ForeignKey(typeof(GenFourn), OnDelete = "CASCADE")]
		[Required]
        [IgnoreDataMember]
		public int CleFourn { get; set; }

		/// <summary>
		/// Fournisseur parent. Code unique.
		/// </summary>
        /// <remarks>
		/// Remplace la propriété <see cref="CleFourn" /> dans la sérialisation.
		/// Référence la propriété <see cref="GenFourn.CodFourn" />.
        /// </remarks>
		[ApiMember(Description = "Fournisseur parent. Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		[Ignore]
		public string CodFourn { get; set; }

		/// <summary>
		/// Nom de famille.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
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
		public string TxtContact { get; set; }

		/// <summary>
		/// Date de création.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de création.", DataType = SwaggerDataTypes.DateTime)]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de dernière modification.", DataType = SwaggerDataTypes.DateTime)]
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
