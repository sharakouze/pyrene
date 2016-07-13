namespace Tmpi.Pyrene.Core.Models.Enums
{
    public enum TypCompteur : short
    {
        Undefined = 0,

        CommandeFournisseur = 100,
        Demande = 101,
        LivraisonInterne = 105,
        FactureFournisseur = 107,
        LotInterne = 108,
        LotInterneTemporaire = 109,
        RetourDemande = 110,

        Intervention = 400,

        DemandePrelevement = 800,
        RegroupementTache = 801,

        Paiement = 901,
        Facture = 903,

        Dossier = 1201,
        Echantillon = 1202,
        DemandeAnalyse = 1204,
        Devis = 1205,
        FeuillePaillasse = 1206,
        EchantillonPredossier = 1215,

        Predossier = 1407,
        PlaqueMicrotube = 1408,
        Microplaque = 1409,
        LotTacheAutomate = 1410,
    }
}
