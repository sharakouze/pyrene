//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Net;
using ServiceStack;
using Tmpi.Pyrene.Services.ServiceModel.Types;
using Tmpi.Pyrene.Infrastructure;

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Retourne une ressource <see cref="GenExercice" /> à partir de son Id.
	/// </summary>
	[Route("/GenExercice/{Id}", HttpVerbs.Get, Summary = "Retourne une ressource GenExercice à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenExercice spécifiée est introuvable.")]
	public partial class GetGenExercice : IReturn<GenExercice>
	{
        /// <summary>
        /// Id de la ressource <see cref="GenExercice" /> à retourner.
        /// </summary>
        [ApiMember(Description = "", IsRequired = true, DataType = SwaggerDataTypes.Integer, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string[] Fields { get; set; }
	}
}
