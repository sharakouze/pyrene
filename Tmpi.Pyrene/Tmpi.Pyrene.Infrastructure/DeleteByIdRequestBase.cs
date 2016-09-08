

namespace Tmpi.Pyrene.Infrastructure
{
    /// <summary>
    /// Supprime une entité spécifiée par son Id.
    /// </summary>
    public abstract class DeleteByIdRequestBase //: IReturnVoid
    {
        /// <summary>
        /// Clé primaire de l'entité à supprimer.
        /// </summary>
        public int Id { get; set; }
    }
}
