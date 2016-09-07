namespace Tmpi.Pyrene.Infrastructure.Types
{
    /// <summary>
    /// Représente une entité que l'ont peut contacter.
    /// </summary>
    public interface IHasContact
    {
        /// <summary>
        /// Obtient ou définit le numéro de téléphone.
        /// </summary>
        string NumTelep { get; set; }

        /// <summary>
        /// Obtient ou définit le numéro de fax.
        /// </summary>
        string NumFax { get; set; }

        /// <summary>
        /// Obtient ou définit l'adresse email.
        /// </summary>
        string NumEmail { get; set; }
    }
}
