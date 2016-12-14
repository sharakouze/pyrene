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
	[Route("/Personne/{ClePersonne}/Signature", HttpVerbs.Post, Summary = "Ajoute ou remplace une entité PersonneSignature à partir de son id", Notes = SwaggerDescriptions.UpsertRequestNotes)]
	[ApiResponse(HttpStatusCode.Conflict, "L'entité PersonneSignature spécifiée est un doublon")]
	public partial class PersonneSignature : IReturn<PersonneSignature>, IPost
	{
		/// <summary>
		/// Identifiant unique de l'utilisateur parent.
		/// </summary>
		/// <remarks>
		/// Clé primaire.
		/// Référence <see cref="Personne.ClePersonne"/>.
		/// </remarks>
		[ForeignKey(typeof(Personne), OnDelete = "CASCADE")]
		[Required]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique de l'utilisateur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Entité référencée par <see cref="ClePersonne"/>.
		/// </summary>
		[Reference]
		public Personne Personne { get; set; }

		/// <summary>
		/// Image de la signature.
		/// </summary>
		[Required]
		[ApiMember(Description = "Image de la signature", DataType = SwaggerDataTypes.File, IsRequired = true)]
		public byte[] ImgSignature { get; set; }

		/// <summary>
		/// Type MIME de l'image.
		/// </summary>
		[StringLength(255)]
		[Required]
		[ApiMember(Description = "Type MIME de l'image", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string TypMime { get; set; }

	}
}
