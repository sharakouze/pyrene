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
    [Route("/Exercice", HttpVerbs.Post, Summary = "Ajoute une ressource GenExercice.")]
    [Route("/Exercice/{CleExercice}", HttpVerbs.Put, Summary = "Remplace une ressource GenExercice.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenExercice spécifiée est introuvable.")]
	public partial class GenExercice : IAuditable
	{
		/// <summary>
		/// Identifiant unique. Clé primaire. Immutable.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique. Clé primaire. Immutable.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path, Verb = HttpVerbs.Put)]
		public int CleExercice { get; set; }

		/// <summary>
		/// Code. Unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code. Unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodExercice { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibExercice { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.", DataType = SwaggerDataTypes.String)]
		public string TxtExercice { get; set; }

		/// <summary>
		/// Actif ou inactif.
		/// </summary>
		[Required]
		[ApiMember(Description = "Actif ou inactif.", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstActif { get; set; }

		/// <summary>
		/// Date de création. Immutable.
		/// </summary>
		[Required]
		public DateTime DatCreation { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur responsable de la création. Immutable.
		/// </summary>
		[Required]
		public int CleCreateur { get; set; }

		/// <summary>
		/// Date de dernière modification. Immutable.
		/// </summary>
		public DateTime? DatEdition { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur responsable de la dernière modification. Immutable.
		/// </summary>
		public int? CleEditeur { get; set; }

		/// <summary>
		/// Identifiant de synchronisation externe.
		/// </summary>
		[StringLength(100)]
		[ApiMember(Description = "Identifiant de synchronisation externe.", DataType = SwaggerDataTypes.String)]
		public string CodExterne { get; set; }

		/// <summary>
		/// Date de début.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de début.", DataType = SwaggerDataTypes.DateTime, IsRequired = true)]
		public DateTime DatDebut { get; set; }

		/// <summary>
		/// Date de fin.
		/// </summary>
		[Required]
		[ApiMember(Description = "Date de fin.", DataType = SwaggerDataTypes.DateTime, IsRequired = true)]
		public DateTime DatFin { get; set; }

	}
}
