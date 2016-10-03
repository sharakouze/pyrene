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

namespace Tmpi.Pyrene.Services.ServiceModel
{
	/// <summary>
	/// Modifie partiellement une ressource <see cref="GenPersonne" /> à partir de son Id.
	/// </summary>
	[Route("/GenPersonne/{Id}", HttpVerbs.Patch, Summary = "Modifie partiellement une ressource GenPersonne à partir de son Id.")]
    [ApiResponse(HttpStatusCode.NotFound, "La ressource GenPersonne spécifiée est introuvable.")]
	public partial class PatchGenPersonne : IReturnVoid
	{
        /// <summary>
        /// Id de la ressource <see cref="GenPersonne" /> à modifier.
        /// </summary>
        [ApiMember(Description = "Id de la ressource GenPersonne à modifier.", DataType = SwaggerDataTypes.Int, IsRequired = true, ParameterType = SwaggerParamTypes.Path)]
        public int Id { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [ApiMember(Description = "Liste des modifications.", DataType = "Array[" + nameof(Patch) + "]", IsRequired = true, ParameterType = SwaggerParamTypes.Body)]
        public Patch[] Fields { get; set; }
    }
}
