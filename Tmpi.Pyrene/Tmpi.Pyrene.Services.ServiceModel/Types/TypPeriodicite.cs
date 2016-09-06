#pragma warning disable 1591

using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    /// <summary>
    /// Spécifie la périodicité d'un compteur.
    /// </summary>
    [EnumAsInt]
    public enum TypPeriodicite
    {
        Undefined = 0,

        Quotidien = 1,
        Hebdomadaire = 2,
        Mensuel = 3,
        Trimestriel = 4,
        Semestriel = 5,
        Annuel = 6,
    }
}
