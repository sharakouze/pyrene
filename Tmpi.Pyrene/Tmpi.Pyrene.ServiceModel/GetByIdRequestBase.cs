using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel
{
    /// <summary>
    /// Retourne une entité spécifiée.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public abstract class GetByIdRequestBase<T> : IReturn<T>, IGetByIdRequest<int>
    {
        /// <summary>
        /// Clé primaire de l'entité à retourner.
        /// </summary>
        [ApiMember(IsRequired = true, Description = "Clé primaire de l'entité à retourner.")]
        public int Id { get; set; }
    }
}
