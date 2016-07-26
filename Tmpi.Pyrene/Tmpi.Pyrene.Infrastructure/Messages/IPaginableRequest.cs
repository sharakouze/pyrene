namespace Tmpi.Pyrene.Infrastructure.Messages
{
    /// <summary>
    /// Fournit les fonctionnalités permettant 
    /// </summary>
    public interface IPaginableRequest : ISortableRequest
    {
        /// <summary>
        /// Nombre d'éléments à ignorer.
        /// </summary>
        int Skip { get; set; }

        /// <summary>
        /// Nombre d'éléments contigus à retourner.
        /// </summary>
        int Take { get; set; }
    }
}
