using ServiceStack;

namespace Tmpi.Pyrene.Services.ServiceModel
{
    /// <summary>
    /// Retourne une entité spécifiée par son Id.
    /// </summary>
    /// <typeparam name="TKey">Type de Id.</typeparam>
    /// <typeparam name="TReturn">Type de l'entité à retourner.</typeparam>
    public abstract class GetByIdRequestBase<TKey, TReturn> : IReturn<TReturn>
    {
        /// <summary>
        /// Clé primaire de l'entité à retourner.
        /// </summary>
        public TKey Id { get; set; }
    }
}
