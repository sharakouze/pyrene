namespace Tmpi.Pyrene.ServiceModel.Types
{
    /// <summary>
    /// Représente une entité ayant les champs d'identification standard.
    /// </summary>
    public interface IHasStandard
    {
        /// <summary>
        /// Obtient ou définit le code.
        /// </summary>
        string CodObjet { get; set; }

        /// <summary>
        /// Obtient ou définit la désignation.
        /// </summary>
        string LibObjet { get; set; }

        /// <summary>
        /// Obtient ou définit le commentaire.
        /// </summary>
        string TxtObjet { get; set; }
    }
}
