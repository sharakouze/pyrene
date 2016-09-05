using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel
{
    /// <summary>
    /// Retourne une entité spécifiée par son Id.
    /// </summary>
    /// <typeparam name="T">Type de l'entité à retourner.</typeparam>
    public abstract class GetByIdRequestBase<T> : IReturn<T>, IGetByIdRequest<int>
    {
        /// <summary>
        /// Clé primaire de l'entité à retourner.
        /// </summary>
        public int Id { get; set; }
    }
}
