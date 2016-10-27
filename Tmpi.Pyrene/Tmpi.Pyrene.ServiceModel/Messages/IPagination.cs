namespace Tmpi.Pyrene.ServiceModel.Messages
{
    /// <summary>
    /// Représente une requête paginable.
    /// </summary>
    public interface IPagination
    {
        /// <summary>
        /// Obtient ou définit le nombre d'éléments à ignorer avant de retourner les éléments restants.
        /// </summary>
        int? Skip { get; set; }

        /// <summary>
        /// Obtient ou définit le nombre d'éléments à retourner.
        /// </summary>
        int? Take { get; set; }

        /// <summary>
        /// Obtient ou définit l'ordre de tri.
        /// </summary>
        /// <remarks>
        /// En préfixant le nom du champ avec le caractère moins (-) le tri sera descendant. Par défaut le tri est ascendant.
        /// </remarks>
        string[] Sort { get; set; }
    }
}
