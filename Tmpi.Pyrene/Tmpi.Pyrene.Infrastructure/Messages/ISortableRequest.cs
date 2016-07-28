namespace Tmpi.Pyrene.Infrastructure.Messages
{
    /// <summary>
    /// Représente une requête dont le résultat est triable.
    /// </summary>
    public interface ISortableRequest
    {
        /// <summary>
        /// 
        /// </summary>
        string[] Sort { get; set; }
    }
}
