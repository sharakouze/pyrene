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
	[CompositeIndex(true, nameof(TypMandat), nameof(NivMandat))]
    [Route("/Mandat", HttpVerbs.Post, Summary = "Ajoute une ressource GenMandat.")]
    [Route("/Mandat/{CleMandat}", HttpVerbs.Put, Summary = "Remplace une ressource GenMandat.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenMandat spécifiée est introuvable.")]
	public partial class GenMandat : IAuditable
	{
		/// <summary>
		/// Identifiant unique. Clé primaire. Immutable.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique. Clé primaire. Immutable.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path, Verb = HttpVerbs.Put)]
		public int CleMandat { get; set; }

		/// <summary>
		/// Code. Unique.
		/// </summary>
		[StringLength(100)]
		[Required]
		[Index(true)]
		[ApiMember(Description = "Code. Unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string CodMandat { get; set; }

		/// <summary>
		/// Désignation.
		/// </summary>
		[StringLength(200)]
		[Required]
		[Index]
		[ApiMember(Description = "Désignation.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string LibMandat { get; set; }

		/// <summary>
		/// Commentaire ou description.
		/// </summary>
		[StringLength(500)]
		[ApiMember(Description = "Commentaire ou description.", DataType = SwaggerDataTypes.String)]
		public string TxtMandat { get; set; }

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
		/// Type de mandat.
		/// </summary>
		[Required]
		[ApiMember(Description = "Type de mandat.", IsRequired = true)]
		[ApiAllowableValues(nameof(TypMandat), typeof(TypMandat))]
		public TypMandat TypMandat { get; set; }

		/// <summary>
		/// Niveau du mandat.
		/// </summary>
		[Required]
		[ApiMember(Description = "Niveau du mandat.", DataType = SwaggerDataTypes.Byte, IsRequired = true)]
		public byte NivMandat { get; set; }

		/// <summary>
		/// Nombre de signatures requises.
		/// </summary>
		[Required]
		[ApiMember(Description = "Nombre de signatures requises.", DataType = SwaggerDataTypes.Byte, IsRequired = true)]
		public byte NbrSignature { get; set; }

		/// <summary>
		/// Corps du message.
		/// </summary>
		[ApiMember(Description = "Corps du message.", DataType = SwaggerDataTypes.String)]
		public string TxtMessage { get; set; }

		[Reference]
		public List<GenMandatMandataire> LstMandataire { get; set; }

	}
}
