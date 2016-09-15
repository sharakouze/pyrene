using ServiceStack;

namespace Tmpi.Pyrene.Services.ServiceModel
{
    /// <summary>
    /// Supprime une entité spécifiée par son Id.
    /// </summary>
    /// <typeparam name="TKey">Type de Id.</typeparam>
    public abstract class DeleteByIdRequestBase<TKey> : IReturnVoid
    {
        /// <summary>
        /// Clé primaire de l'entité à supprimer.
        /// </summary>
        public TKey Id { get; set; }
    }
}
