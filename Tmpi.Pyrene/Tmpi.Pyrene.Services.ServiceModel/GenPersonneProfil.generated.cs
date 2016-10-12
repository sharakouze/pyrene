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
	[CompositeIndex(true, nameof(ClePersonne), nameof(CleService))]
	[CompositeIndex(true, nameof(CodProfil), nameof(ClePersonne))]
    [Route("/Personne/{ClePersonne}/Profil", HttpVerbs.Post, Summary = "Ajoute une ressource GenPersonneProfil.")]
    [Route("/Personne/{ClePersonne}/Profil/{CleProfil}", HttpVerbs.Put, Summary = "Remplace une ressource GenPersonneProfil.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	public partial class GenPersonneProfil : IAuditable
	{
		/// <summary>
		/// Clé primaire. Immutable.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Clé primaire. Immutable.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Post)]
		[ApiMember(Description = "Clé primaire. Immutable.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Put, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleProfil { get; set; }

		/// <summary>
		/// Clé de l'utilisateur parent.
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Clé de l'utilisateur parent.", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Code.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Code.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodProfil { get; set; }

		/// <summary>
		/// Date de création. Immutable.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de création. Immutable.", DataType = SwaggerDataTypes.DateTime)]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Date de dernière modification. Immutable.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de dernière modification. Immutable.", DataType = SwaggerDataTypes.DateTime)]
		public DateTime DatModif { get; set; }

		/// <summary>
		/// Clé du service auquel a accès le profil, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
		[ApiMember(Description = "Clé du service auquel a accès le profil, ou null pour tous les services.", DataType = SwaggerDataTypes.Int)]
		public int? CleService { get; set; }

	}
}
