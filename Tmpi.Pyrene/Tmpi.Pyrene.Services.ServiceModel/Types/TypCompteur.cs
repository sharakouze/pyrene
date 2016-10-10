using ServiceStack.DataAnnotations;

#pragma warning disable 1591

namespace Tmpi.Pyrene.Services.ServiceModel.Types
{
    /// <summary>
    /// Spécifie le type d'un compteur.
    /// </summary>
    [EnumAsInt]
    public enum TypCompteur
    {
        Undefined = 0,

        // 1. Stock

        CommandeFournisseur = 100,
        Demande = 101,
        LivraisonInterne = 105,
        FactureFournisseur = 107,
        LotInterne = 108,
        LotInterneTemporaire = 109,
        RetourDemande = 110,

        // 4. GMAO

        Intervention = 400,

        // Tournée

        DemandePrelevement = 800,
        RegroupementTache = 801,

        // 9. Facturation

        Paiement = 901,
        Facture = 903,

        // 12. Symphonie

        Dossier = 1201,
        Echantillon = 1202,
        DemandeAnalyse = 1204,
        Devis = 1205,
        FeuillePaillasse = 1206,
        EchantillonPredossier = 1215,

        // 14. Prélude

        Predossier = 1407,
        PlaqueMicrotube = 1408,
        Microplaque = 1409,
        LotTacheAutomate = 1410,
    }
}
