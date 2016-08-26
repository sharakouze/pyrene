using ServiceStack;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    /// <summary>
    /// Supprime une entité <see cref="GenSociete" />.
    /// </summary>
    public class DeleteGenSociete : IReturnVoid
    {
        /// <summary>
        /// Clé primaire de la <see cref="GenSociete" /> à supprimer.
        /// </summary>
        public int CleSociete { get; set; }
    }
}
