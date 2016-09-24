using ServiceStack.Model;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    /// <summary>
    /// Représente une entité identifiée par un code, une désignation et un état actif ou inactif.
    /// </summary>
    public interface IEntity
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
        /// Obtient ou définit le commentaire ou la description.
        /// </summary>
        bool EstActif { get; set; }
    }
}
