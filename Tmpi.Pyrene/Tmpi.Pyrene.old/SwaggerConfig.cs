using System.Collections.Generic;

namespace Tmpi.Pyrene
{
    internal static class SwaggerConfig
    {
        public static Dictionary<string, string> GetRouteSummary()
        {
            return new Dictionary<string, string>
            {
                { "/Compteur", "Compteurs de numérotation" },
                { "/Exercice", "Exercices budgétaires" },
                { "/Fourn", "Fournisseurs" },
                { "/Mandat", "Mandats" },
                { "/Personne", "Utilisateurs" },
                { "/Service", "Services" },
                { "/TVA", "Taux de TVA" },
            };
        }
    }
}