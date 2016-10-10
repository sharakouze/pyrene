using ServiceStack.DataAnnotations;

#pragma warning disable 1591

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    /// <summary>
    /// Spécifie le type d'un mandat.
    /// </summary>
    [EnumAsInt]
    public enum TypMandat
    {
        Undefined = 0,

        // 1. Stock

        Demande = 101,
        CommandeFournisseur = 102,
    }
}
