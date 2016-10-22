using ServiceStack.DataAnnotations;

#pragma warning disable 1591

namespace Tmpi.Pyrene.ServiceModel.Types
{
    /// <summary>
    /// Spécifie le titre de civilité d'une personne.
    /// </summary>
    [EnumAsInt]
    public enum TypCivilite
    {
        Undefined = 0,

        Monsieur = 1,
        Madame = 2,
        Mademoiselle = 3,
    }
}
