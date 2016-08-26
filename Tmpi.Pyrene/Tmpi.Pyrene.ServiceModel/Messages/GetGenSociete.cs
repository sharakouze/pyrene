using ServiceStack;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    /// <summary>
    /// Retourne une entité <see cref="GenSociete" />.
    /// </summary>
    public class GetGenSociete : IReturn<GenSociete>
    {
        /// <summary>
        /// Clé primaire de l'entité <see cref="GenSociete" /> à retourner.
        /// </summary>
        public int CleSociete { get; set; }
    }
}
