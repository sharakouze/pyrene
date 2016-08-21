#pragma warning disable 1591

namespace Tmpi.Pyrene.Models.Entities
{
    /// <summary>
    /// Spécifie la périodicité d'un compteur.
    /// </summary>
    public enum TypPeriodicite : byte
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
