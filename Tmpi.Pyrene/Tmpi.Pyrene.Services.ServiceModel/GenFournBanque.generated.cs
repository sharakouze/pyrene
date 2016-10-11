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
	[CompositeIndex(true, nameof(CleFourn), nameof(CodIBAN))]
    [Route("/Fourn/{CleFourn}/Banque", HttpVerbs.Post, Summary = "Ajoute une ressource GenFournBanque.")]
    [Route("/Fourn/{CleFourn}/Banque/{CleBanque}", HttpVerbs.Put, Summary = "Remplace une ressource GenFournBanque.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenFournBanque spécifiée est introuvable.")]
	public partial class GenFournBanque : IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Post)]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Put, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleBanque { get; set; }

		/// <summary>
		/// Fournisseur parent.
		/// </summary>
		[ForeignKey(typeof(GenFourn), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Fournisseur parent.", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleFourn { get; set; }

		/// <summary>
		/// Code IBAN.
		/// </summary>
		[StringLength(34)]
		[Required]
		[ApiMember(Description = "Code IBAN.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodIBAN { get; set; }

		/// <summary>
		/// Code BIC.
		/// </summary>
		[StringLength(11)]
		[Required]
		[ApiMember(Description = "Code BIC.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodBIC { get; set; }

		/// <summary>
		/// Nom de l'établissement bancaire.
		/// </summary>
		[StringLength(200)]
		[Required]
		[ApiMember(Description = "Nom de l'établissement bancaire.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibEtablissement { get; set; }

		/// <summary>
		/// Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur.
		/// </summary>
		[Required]
		[ApiMember(Description = "Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur.", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstDefaut { get; set; }

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

	}
}
