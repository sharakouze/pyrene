﻿#pragma warning disable 1591

using ServiceStack.DataAnnotations;

namespace Tmpi.Pyrene.ServiceModel.Types
{
    /// <summary>
    /// Spécifie le type d'un mandat.
    /// </summary>
    [EnumAsInt]
    public enum TypMandat
    {
        Undefined = 0,

        Demande = 101,
        CommandeFournisseur = 102,
    }
}
