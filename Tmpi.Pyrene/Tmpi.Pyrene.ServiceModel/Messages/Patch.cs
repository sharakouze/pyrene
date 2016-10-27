using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    /// <summary>
    /// Représente une opération de modification partielle.
    /// </summary>
    public class Patch
    {
        /// <summary>
        /// Champ à modifier.
        /// </summary>
        [ApiMember(Description = "Champ à modifier", DataType = SwaggerDataTypes.String, IsRequired = true)]
        public string Field { get; set; }

        /// <summary>
        /// Valeur du champ.
        /// </summary>
        [ApiMember(Description = "Valeur du champ", IsRequired = true)]
        public object Value { get; set; }
    }
}
