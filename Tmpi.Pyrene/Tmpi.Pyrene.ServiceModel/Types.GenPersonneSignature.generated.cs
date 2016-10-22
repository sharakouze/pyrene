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
    [Route("/Personne/{ClePersonne}/Signature", HttpVerbs.Post, Summary = "Ajoute ou remplace une ressource Signature (Personne) à partir de son id")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource spécifiée est introuvable")]
    [ApiResponse(HttpStatusCode.Conflict, "La ressource spécifiée est un doublon")]
	public partial class GenPersonneSignature : IReturn<GenPersonneSignature>, IPost
	{
		/// <summary>
		/// Identifiant unique de l'utilisateur parent
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
		[PrimaryKey]
		[ApiMember(Description = "Identifiant unique de l'utilisateur parent", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Image de la signature
		/// </summary>
		[Required]
		[ApiMember(Description = "Image de la signature", DataType = SwaggerDataTypes.File, IsRequired = true)]
		public byte[] ImgSignature { get; set; }

		/// <summary>
		/// Type MIME de l'image
		/// </summary>
		[StringLength(255)]
		[Required]
		[ApiMember(Description = "Type MIME de l'image", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string TypMime { get; set; }

	}
}
