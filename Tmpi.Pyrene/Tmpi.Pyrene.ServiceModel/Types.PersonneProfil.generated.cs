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
	[CompositeIndex(true, nameof(ClePersonne), nameof(CleService))]
	[CompositeIndex(true, nameof(CodProfil), nameof(ClePersonne))]
	[Route("/Personne/{ClePersonne}/Profil", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité PersonneProfil à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité PersonneProfil spécifiée est un doublon")]
	[ApiResponse(HttpStatusCode.NotFound, "L'entité PersonneProfil spécifiée est introuvable")]
	public partial class PersonneProfil : IReturn<PersonneProfil>, IPost, IAuditable
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
		public int CleProfil { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur parent.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="Personne.ClePersonne"/>.
		/// </remarks>
		[ForeignKey(typeof(Personne), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Identifiant unique de l'utilisateur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="ClePersonne"/>.
		/// </summary>
		[Reference]
		public Personne Personne { get; set; }

		/// <summary>
		/// Code.
		/// </summary>
		[StringLength(100)]
		[Required]
		[ApiMember(Description = "Code", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodProfil { get; set; }

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

		/// <summary>
		/// Identifiant unique du service auquel a accès le profil, ou null pour tous les services.
		/// </summary>
		/// <remarks>
		/// Référence <see cref="Service.CleService"/>.
		/// </remarks>
		[References(typeof(Service))]
		[ApiMember(Description = "Identifiant unique du service auquel a accès le profil, ou null pour tous les services", DataType = SwaggerDataTypes.Int)]
		public int? CleService { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="CleService"/>.
		/// </summary>
		[Reference]
		public Service Service { get; set; }

	}
}
