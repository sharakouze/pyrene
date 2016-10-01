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
	/// Modifie une ressource <see cref="GenPersonne" /> à partir de son Id.
	/// </summary>
	[Route("/GenPersonne/{Id}", HttpVerbs.Patch, Summary = "Modifie une ressource GenPersonne à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonne spécifiée est introuvable.")]
	public partial class PatchGenPersonne : IReturnVoid
	{
        /// <summary>
        /// Id de la ressource <see cref="GenPersonne" /> à modifier.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenPersonne à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParameterTypes.Path)]
        public int Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [ApiMember(Description = "", DataType = "Array[" + nameof(PatchElement) + "]", IsRequired = true, ParameterType = SwaggerParameterTypes.Form)]
        public PatchElement[] Fields { get; set; }
    }
}
