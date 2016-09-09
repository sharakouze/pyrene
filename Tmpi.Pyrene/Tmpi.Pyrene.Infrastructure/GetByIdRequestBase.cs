namespace Tmpi.Pyrene.Infrastructure
{
    /// <summary>
    /// Retourne une entité spécifiée par son Id.
    /// </summary>
    /// <typeparam name="TKey">Type de Id.</typeparam>
    /// <typeparam name="TReturn">Type de l'entité à retourner.</typeparam>
    public abstract class GetByIdRequestBase<TKey, TReturn> //: IReturn<T>
    {
        /// <summary>
        /// Clé primaire de l'entité à retourner.
        /// </summary>
        public TKey Id { get; set; }
    }
}
