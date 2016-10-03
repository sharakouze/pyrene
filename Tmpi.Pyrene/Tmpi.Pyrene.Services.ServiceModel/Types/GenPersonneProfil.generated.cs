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
	[CompositeIndex(true, nameof(CleGenPersonne), nameof(CleGenSociete), nameof(CleGenSecteur), nameof(CleGenService))]
	[CompositeIndex(true, nameof(CodObjet), nameof(CleGenPersonne))]
    [Route("/GenPersonne/Profil", HttpVerbs.Post, Summary = "Ajoute une ressource GenPersonneProfil.")]
    [Route("/GenPersonne/Profil/{Id}", HttpVerbs.Put, Summary = "Remplace une ressource GenPersonneProfil à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneProfil spécifiée est introuvable.")]
	public partial class GenPersonneProfil : IHasId<int>,
		IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Post)]
		[ApiMember(Description = "Clé primaire.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Put, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int Id { get; set; }

		/// <summary>
		/// Id de l'utilisateur parent.
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Id de l'utilisateur parent.", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleGenPersonne { get; set; }

		/// <summary>
		/// Code.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Code.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodObjet { get; set; }

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
		/// Id de la société à laquelle a accès le profil, ou null pour toutes les sociétés.
		/// </summary>
		[References(typeof(GenSociete))]
		[ApiMember(Description = "Id de la société à laquelle a accès le profil, ou null pour toutes les sociétés.", DataType = SwaggerDataTypes.Int)]
		public int? CleGenSociete { get; set; }

		/// <summary>
		/// Id du secteur auquel a accès le profil, ou null pour tous les secteurs.
		/// </summary>
		[References(typeof(GenSecteur))]
		[ApiMember(Description = "Id du secteur auquel a accès le profil, ou null pour tous les secteurs.", DataType = SwaggerDataTypes.Int)]
		public int? CleGenSecteur { get; set; }

		/// <summary>
		/// Id du service auquel a accès le profil, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
		[ApiMember(Description = "Id du service auquel a accès le profil, ou null pour tous les services.", DataType = SwaggerDataTypes.Int)]
		public int? CleGenService { get; set; }

	}
}
