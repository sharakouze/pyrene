using ServiceStack;

namespace Tmpi.Pyrene.Services.ServiceModel
{
    /// <summary>
    /// Retourne une ressource spécifiée par son Id.
    /// </summary>
    /// <typeparam name="TKey">Type de Id.</typeparam>
    /// <typeparam name="TReturn">Type de la ressource à retourner.</typeparam>
    public abstract class GetByIdRequestBase<TKey, TReturn> : IReturn<TReturn>
    {
        /// <summary>
        /// Clé primaire de la ressource à retourner.
        /// </summary>
        public TKey Id { get; set; }
    }
}
