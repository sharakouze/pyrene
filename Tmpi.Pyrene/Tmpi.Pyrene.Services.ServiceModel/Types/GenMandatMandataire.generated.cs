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
	[CompositeIndex(true, nameof(CleMandat), nameof(ClePersonne), nameof(CleSociete), nameof(CleSecteur), nameof(CleService))]
    [Route("/Mandat/{CodMandat}/Mandataire/{ClePersonne}/{CleSociete}/{CleSecteur}/{CleService}", HttpVerbs.Post, Summary = "Ajoute une ressource GenMandatMandataire.")]
    [Route("/Mandat/{CodMandat}/Mandataire/{ClePersonne}/{CleSociete}/{CleSecteur}/{CleService}", HttpVerbs.Put, Summary = "Remplace une ressource GenMandatMandataire à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenMandatMandataire spécifiée est introuvable.")]
	public partial class GenMandatMandataire : IAuditable
	{
		/// <summary>
		/// Clé primaire.
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
        [IgnoreDataMember]
		public int CleMandataire { get; set; }

		/// <summary>
		/// Mandat parent.
		/// </summary>
		[ForeignKey(typeof(GenMandatMandataire), OnDelete = "CASCADE")]
		[Required]
        [IgnoreDataMember]
		public int CleMandat { get; set; }

		/// <summary>
		/// Mandat parent. Code unique.
		/// Remplace la colonne <see cref="CleMandat" /> dans la sérialisation.
		/// </summary>
		[ApiMember(Description = "Mandat parent. Code unique.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		[Ignore]
		public string CodMandat { get; set; }

		/// <summary>
		/// Utilisateur mandataire.
		/// </summary>
		[References(typeof(GenMandatMandataire))]
		[Required]
        [IgnoreDataMember]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Utilisateur mandataire. 
		/// Remplace la colonne <see cref="ClePersonne" /> dans la sérialisation.
		/// </summary>
		[ApiMember(Description = "Utilisateur mandataire. ", DataType = SwaggerDataTypes.String, IsRequired = true)]
		[Ignore]
		public string CodPersonne { get; set; }

		/// <summary>
		/// Société ayant accès au mandat, ou null pour toutes les sociétés.
		/// </summary>
		[References(typeof(GenMandatMandataire))]
        [IgnoreDataMember]
		public int? CleSociete { get; set; }

		/// <summary>
		/// Société ayant accès au mandat, ou null pour toutes les sociétés. 
		/// Remplace la colonne <see cref="CleSociete" /> dans la sérialisation.
		/// </summary>
		[ApiMember(Description = "Société ayant accès au mandat, ou null pour toutes les sociétés. ", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodSociete { get; set; }

		/// <summary>
		/// Secteur ayant accès au mandat, ou null pour tous les secteurs.
		/// </summary>
		[References(typeof(GenMandatMandataire))]
        [IgnoreDataMember]
		public int? CleSecteur { get; set; }

		/// <summary>
		/// Secteur ayant accès au mandat, ou null pour tous les secteurs. 
		/// Remplace la colonne <see cref="CleSecteur" /> dans la sérialisation.
		/// </summary>
		[ApiMember(Description = "Secteur ayant accès au mandat, ou null pour tous les secteurs. ", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodSecteur { get; set; }

		/// <summary>
		/// Service ayant accès au mandat, ou null pour tous les services.
		/// </summary>
		[References(typeof(GenMandatMandataire))]
        [IgnoreDataMember]
		public int? CleService { get; set; }

		/// <summary>
		/// Service ayant accès au mandat, ou null pour tous les services. 
		/// Remplace la colonne <see cref="CleService" /> dans la sérialisation.
		/// </summary>
		[ApiMember(Description = "Service ayant accès au mandat, ou null pour tous les services. ", DataType = SwaggerDataTypes.String)]
		[Ignore]
		public string CodService { get; set; }

		/// <summary>
		/// Si true, le mandat est suspendu.
		/// </summary>
		[Required]
		[ApiMember(Description = "Si true, le mandat est suspendu.", DataType = SwaggerDataTypes.Bool, IsRequired = true)]
		public bool EstSuspendu { get; set; }

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

		[Reference]
		public GenMandatMandataire  { get; set; }

		[Reference]
		public GenMandatMandataire  { get; set; }

		[Reference]
		public GenMandatMandataire  { get; set; }

		[Reference]
		public GenMandatMandataire  { get; set; }

		[Reference]
		public GenMandatMandataire  { get; set; }

	}
}
