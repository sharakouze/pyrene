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

namespace Tmpi.Pyrene.ServiceModel.Types
{
	[Schema("Gen")]
	[CompositeIndex(true, nameof(CleCompteur), nameof(ValPeriode))]
    [Route("/Compteur/{CleCompteur}/Valeur", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité Valeur (Compteur) à partir de son id")]
    [ApiResponse(HttpStatusCode.NotFound, "L'entité spécifiée est introuvable")]
    [ApiResponse(HttpStatusCode.Conflict, "L'entité spécifiée est un doublon")]
	public partial class CompteurValeur : IReturn<CompteurValeur>, IPost
	{
		/// <summary>
		/// Identifiant unique (immutable).
		/// </summary>
		[AutoIncrement]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique (immutable)", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int CleValeur { get; set; }

		/// <summary>
		/// Identifiant unique du compteur parent.
		/// </summary>
		[ForeignKey(typeof(Compteur), OnDelete = "CASCADE")]
		[Required]
		[ApiMember(Description = "Identifiant unique du compteur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int CleCompteur { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="CleCompteur"/>.
		/// </summary>
		[Reference]
		public Compteur Compteur { get; set; }

		/// <summary>
		/// Valeur de la période.
		/// </summary>
		[Required]
		[ApiMember(Description = "Valeur de la période", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int ValPeriode { get; set; }

		/// <summary>
		/// Valeur du compteur.
		/// </summary>
		[Required]
		[ApiMember(Description = "Valeur du compteur", DataType = SwaggerDataTypes.Int, IsRequired = true)]
		public int ValCompteur { get; set; }

	}
}