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
    [Route("/Personne", HttpVerbs.Post, Summary = "Ajoute une ressource GenPersonneSignature.")]
    [Route("/Personne/{ClePersonne}", HttpVerbs.Put, Summary = "Remplace une ressource GenPersonneSignature.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonneSignature spécifiée est introuvable.")]
	public partial class GenPersonneSignature
	{
		/// <summary>
		/// Clé de l'utilisateur parent.
		/// </summary>
		[ForeignKey(typeof(GenPersonne), OnDelete = "CASCADE")]
		[Required]
		[PrimaryKey]
		[ApiMember(Description = "Clé de l'utilisateur parent.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Post)]
		[ApiMember(Description = "Clé de l'utilisateur parent.", DataType = SwaggerDataTypes.Int, Verb = HttpVerbs.Put, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
		public int ClePersonne { get; set; }

		/// <summary>
		/// Image de la signature.
		/// </summary>
		[Required]
		[ApiMember(Description = "Image de la signature.", DataType = SwaggerDataTypes.File, IsRequired = true)]
		public byte[] ImgSignature { get; set; }

		/// <summary>
		/// Type MIME de l'image.
		/// </summary>
		[StringLength(255)]
		[Required]
		[ApiMember(Description = "Type MIME de l'image.", DataType = SwaggerDataTypes.String, IsRequired = true)]
		public string TypMime { get; set; }

	}
}
