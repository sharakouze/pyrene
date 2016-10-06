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
	[CompositeIndex(true, nameof(ClePersonne), nameof(CleSociete), nameof(CleSecteur), nameof(CleService))]
	[CompositeIndex(true, nameof(CodProfil), nameof(ClePersonne))]
    [Route("/Personne/{CodPersonne}/Profil/{CodProfil}", HttpVerbs.Post, Summary = "Ajoute une ressource GenPersonneProfil.")]
    [Route("/Personne/{CodPersonne}/Profil/{CodProfil}", HttpVerbs.Put, Summary = "Remplace une ressource GenPersonneProfil à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	public partial class GenPersonneProfil : IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
        [IgnoreDataMember]
		public int CleProfil { get; set; }

		/// <summary>
		/// Utilisateur parent.
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
        [IgnoreDataMember]
		public int ClePersonne { get; set; }

		[StringLength(100)]
		[Required]
		[ApiMember(DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodProfil { get; set; }

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
		/// Société à laquelle a accès le profil, ou null pour toutes les sociétés.
		/// </summary>
		[References(typeof(GenSociete))]
        [IgnoreDataMember]
		public int? CleSociete { get; set; }

		/// <summary>
		/// Secteur auquel a accès le profil, ou null pour tous les secteurs.
		/// </summary>
		[References(typeof(GenSecteur))]
        [IgnoreDataMember]
		public int? CleSecteur { get; set; }

		/// <summary>
		/// Service auquel a accès le profil, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
        [IgnoreDataMember]
		public int? CleService { get; set; }

	}
}
