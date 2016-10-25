using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    /// <summary>
    /// Représente une entité définie par un identifiant, un code et une désignation.
    /// </summary>
    public class BaseEntity
    {
        /// <summary>
        /// Identifiant unique.
        /// </summary>
        [ApiMember(Description = "Identifiant unique", DataType = SwaggerDataTypes.Int, IsRequired = true)]
        public int CleObjet { get; set; }

        /// <summary>
        /// Code.
        /// </summary>
        [ApiMember(Description = "Code", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string CodObjet { get; set; }

        /// <summary>
        /// Désignation.
        /// </summary>
        [ApiMember(Description = "Désignation", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string LibObjet { get; set; }
    }
}
