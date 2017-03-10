using System;

namespace Tmpi.Pyrene.ServiceModel.Types
{
    /// <summary>
    /// Représente une entité auditable.
    /// </summary>
    public interface IAuditable
    {
        /// <summary>
        /// Obtient ou définit la date de création.
        /// </summary>
        DateTime DatCreation { get; set; }

        /// <summary>
        /// Obtient ou définit la date de dernière modification.
        /// </summary>
        DateTime? DatModif { get; set; }
    }
}
