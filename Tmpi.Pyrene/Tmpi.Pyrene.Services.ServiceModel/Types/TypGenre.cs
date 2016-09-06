#pragma warning disable 1591

using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    /// <summary>
    /// Spécifie le genre d'une personne.
    /// </summary>
    [EnumAsInt]
    public enum TypGenre
    {
        Undefined = 0,

        Monsieur = 1,
        Madame = 2,
        Mademoiselle = 3,
    }
}
