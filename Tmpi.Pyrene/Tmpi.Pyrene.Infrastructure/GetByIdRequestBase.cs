

namespace Tmpi.Pyrene.Infrastructure
{
    /// <summary>
    /// Retourne une entité spécifiée par son Id.
    /// </summary>
    /// <typeparam name="T">Type de l'entité à retourner.</typeparam>
    public abstract class GetByIdRequestBase<T> : IGetByIdRequest<int> //,IReturn<T>
    {
        /// <summary>
        /// Clé primaire de l'entité à retourner.
        /// </summary>
        public int Id { get; set; }
    }
}
