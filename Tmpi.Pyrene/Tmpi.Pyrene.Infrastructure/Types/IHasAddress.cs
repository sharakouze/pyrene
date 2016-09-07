namespace Tmpi.Pyrene.Infrastructure.Types
{
    /// <summary>
    /// Représente une entité qui possède une adresse postale.
    /// </summary>
    public interface IHasAddress
    {
        /// <summary>
        /// Obtient ou définit la rue.
        /// </summary>
        string AdrRue { get; set; }

        /// <summary>
        /// Obtient ou définit le code postal.
        /// </summary>
        string AdrCode { get; set; }

        /// <summary>
        /// Obtient ou définit la ville.
        /// </summary>
        string AdrVille { get; set; }

        /// <summary>
        /// Obtient ou définit le pays.
        /// </summary>
        string AdrPays { get; set; }
    }
}
