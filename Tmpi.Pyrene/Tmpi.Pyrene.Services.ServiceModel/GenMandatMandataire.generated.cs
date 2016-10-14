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
	[CompositeIndex(true, nameof(CleMandat), nameof(ClePersonne), nameof(CleService))]
    [Route("/Mandat/{CleMandat}/Mandataire", HttpVerbs.Post, Summary = "Ajoute une ressource Mandataire (Mandat).")]
    [Route("/Mandat/Mandataire/{CleMandataire}", HttpVerbs.Put, Summary = "Remplace une ressource Mandataire (Mandat).")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource Mandataire (Mandat) spécifiée est introuvable.")]
	public partial class GenMandatMandataire : IAuditable
	{
		/// <summary>
		/// Identifiant unique. Clé primaire. Immutable.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique. Clé primaire. Immutable.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path, Verb = HttpVerbs.Put)]
		public int CleMandataire { get; set; }

		/// <summary>
		/// Identifiant unique du mandat parent.
		/// </summary>
		[ForeignKey(typeof(GenMandat), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Identifiant unique du mandat parent.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path, Verb = HttpVerbs.Post)]
		public int CleMandat { get; set; }

		/// <summary>
		/// Identifiant unique de l'utilisateur mandataire.
		/// </summary>
		[References(typeof(GenPersonne))]
		[Required]
		[ApiMember(Description = "Identifiant unique de l'utilisateur mandataire.", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Identifiant unique du service ayant accès au mandat, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenService))]
		[ApiMember(Description = "Identifiant unique du service ayant accès au mandat, ou null pour tous les services.", DataType = SwaggerDataTypes.Int)]
		public int? CleService { get; set; }

		/// <summary>
		/// Si true, le mandat est suspendu.
		/// </summary>
		[Required]
		[ApiMember(Description = "Si true, le mandat est suspendu.", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstSuspendu { get; set; }

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

	}
}
