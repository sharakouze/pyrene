/* Options:
Date: 2017-02-22 15:24:43
Version: 4,54
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: http://localhost:50000

//GlobalNamespace: 
//MakePropertiesOptional: True
//AddServiceStackTypes: True
//AddResponseStatus: False
//AddImplicitVersion: 
//AddDescriptionAsComments: True
//IncludeTypes: 
//ExcludeTypes: 
//DefaultImports: 
*/


export interface IReturnVoid
{
}

export interface IReturn<T>
{
}

export type TypPeriodicite = "Undefined" | "Quotidien" | "Hebdomadaire" | "Mensuel" | "Trimestriel" | "Semestriel" | "Annuel";

export type TypCompteur = "Undefined" | "CommandeFournisseur" | "Demande" | "LivraisonInterne" | "FactureFournisseur" | "LotInterne" | "LotInterneTemporaire" | "RetourDemande" | "Intervention" | "DemandePrelevement" | "RegroupementTache" | "Paiement" | "Facture" | "Dossier" | "Echantillon" | "DemandeAnalyse" | "Devis" | "FeuillePaillasse" | "EchantillonPredossier" | "Predossier" | "PlaqueMicrotube" | "Microplaque" | "LotTacheAutomate";

export class Patch
{
    /**
    * Champ à modifier
    */
    // @ApiMember(Description="Champ à modifier", DataType="string", IsRequired=true)
    Field: string;

    /**
    * Valeur du champ
    */
    // @ApiMember(Description="Valeur du champ", IsRequired=true)
    Value: Object;
}

// @DataContract
export class ResponseError
{
    // @DataMember(Order=1, EmitDefaultValue=false)
    ErrorCode: string;

    // @DataMember(Order=2, EmitDefaultValue=false)
    FieldName: string;

    // @DataMember(Order=3, EmitDefaultValue=false)
    Message: string;

    // @DataMember(Order=4, EmitDefaultValue=false)
    Meta: { [index:string]: string; };
}

// @DataContract
export class ResponseStatus
{
    // @DataMember(Order=1)
    ErrorCode: string;

    // @DataMember(Order=2)
    Message: string;

    // @DataMember(Order=3)
    StackTrace: string;

    // @DataMember(Order=4)
    Errors: ResponseError[];

    // @DataMember(Order=5)
    Meta: { [index:string]: string; };
}

export class BaseEntity
{
    /**
    * Identifiant unique
    */
    // @ApiMember(Description="Identifiant unique", DataType="integer", IsRequired=true)
    CleObjet: number;

    /**
    * Code
    */
    // @ApiMember(Description="Code", DataType="string", IsRequired=true)
    CodObjet: string;

    /**
    * Désignation
    */
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibObjet: string;
}

export type TypModeReglement = "Undefined";

export type TypCivilite = "Undefined" | "Monsieur" | "Madame" | "Mademoiselle";

export type TypMandat = "Undefined" | "Demande" | "CommandeFournisseur";

// @Route("/Service", "POST")
// @ApiResponse(409, "L'entité Service spécifiée est un doublon")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
export class Service
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleService: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodService: string;

    /**
    * Désignation
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibService: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtService: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Identifiant unique du service parent
    */
    // @References(typeof(Service))
    // @ApiMember(Description="Identifiant unique du service parent", DataType="integer")
    CleServiceParent: number;

    ServiceParent: Service;
    /**
    * Rue
    */
    // @StringLength(200)
    // @ApiMember(Description="Rue", DataType="string")
    AdrRue: string;

    /**
    * Code postal
    */
    // @StringLength(10)
    // @ApiMember(Description="Code postal", DataType="string")
    AdrCode: string;

    /**
    * Ville ou commune
    */
    // @StringLength(100)
    // @ApiMember(Description="Ville ou commune", DataType="string")
    AdrCommune: string;

    /**
    * Pays
    */
    // @StringLength(100)
    // @ApiMember(Description="Pays", DataType="string")
    AdrPays: string;

    /**
    * Numéro de téléphone
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de téléphone", DataType="string")
    NumTelep: string;

    /**
    * Numéro de fax
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de fax", DataType="string")
    NumFax: string;

    /**
    * Adresse email
    */
    // @StringLength(100)
    // @ApiMember(Description="Adresse email", DataType="string")
    NumEmail: string;
}

// @Route("/Compteur", "POST")
// @ApiResponse(409, "L'entité Compteur spécifiée est un doublon")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
export class Compteur implements IReturn<Compteur>
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleCompteur: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodCompteur: string;

    /**
    * Désignation
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibCompteur: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtCompteur: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Périodicité
    */
    // @Required()
    // @ApiMember(Description="Périodicité", IsRequired=true)
    TypPeriodicite: TypPeriodicite;

    /**
    * Type de compteur
    */
    // @Required()
    // @ApiMember(Description="Type de compteur", IsRequired=true)
    TypCompteur: TypCompteur;

    /**
    * Identifiant unique du service ayant accès au compteur, ou null pour tous les services
    */
    // @References(typeof(Service))
    // @ApiMember(Description="Identifiant unique du service ayant accès au compteur, ou null pour tous les services", DataType="integer")
    CleService: number;

    Service: Service;
    /**
    * Format du modèle de numérotation
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Format du modèle de numérotation", DataType="string", IsRequired=true)
    ValFormatNumero: string;
    createResponse() { return new Compteur(); }
    getTypeName() { return "Compteur"; }
}

// @Route("/Compteur/{CleCompteur}/Valeur", "POST")
// @ApiResponse(409, "L'entité CompteurValeur spécifiée est un doublon")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
export class CompteurValeur implements IReturn<CompteurValeur>
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleValeur: number;

    /**
    * Identifiant unique du compteur parent
    */
    // @Required()
    // @ApiMember(Description="Identifiant unique du compteur parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleCompteur: number;

    Compteur: Compteur;
    /**
    * Valeur de la période
    */
    // @Required()
    // @ApiMember(Description="Valeur de la période", DataType="integer", IsRequired=true)
    ValPeriode: number;

    /**
    * Valeur du compteur
    */
    // @Required()
    // @ApiMember(Description="Valeur du compteur", DataType="integer", IsRequired=true)
    ValCompteur: number;
    createResponse() { return new CompteurValeur(); }
    getTypeName() { return "CompteurValeur"; }
}

export class SearchCompteurResponse
{
    ResponseStatus: ResponseStatus;
    Results: BaseEntity[];
}

export class SelectCompteurResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: Compteur[];
}

export class SelectCompteurValeurResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: CompteurValeur[];
}

// @Route("/Exercice", "POST")
// @ApiResponse(409, "L'entité Exercice spécifiée est un doublon")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
export class Exercice implements IReturn<Exercice>
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleExercice: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodExercice: string;

    /**
    * Désignation
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibExercice: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtExercice: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Date de début
    */
    // @Required()
    // @ApiMember(Description="Date de début", DataType="Date", IsRequired=true)
    DatDebut: string;

    /**
    * Date de fin
    */
    // @Required()
    // @ApiMember(Description="Date de fin", DataType="Date", IsRequired=true)
    DatFin: string;
    createResponse() { return new Exercice(); }
    getTypeName() { return "Exercice"; }
}

export class SearchExerciceResponse
{
    ResponseStatus: ResponseStatus;
    Results: BaseEntity[];
}

export class SelectExerciceResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: Exercice[];
}

// @Route("/Fourn", "POST")
// @ApiResponse(409, "L'entité Fourn spécifiée est un doublon")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
export class Fourn implements IReturn<Fourn>
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleFourn: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodFourn: string;

    /**
    * Désignation
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibFourn: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtFourn: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Rue
    */
    // @StringLength(200)
    // @ApiMember(Description="Rue", DataType="string")
    AdrRue: string;

    /**
    * Code postal
    */
    // @StringLength(10)
    // @ApiMember(Description="Code postal", DataType="string")
    AdrCode: string;

    /**
    * Ville ou commune
    */
    // @StringLength(100)
    // @ApiMember(Description="Ville ou commune", DataType="string")
    AdrCommune: string;

    /**
    * Pays
    */
    // @StringLength(100)
    // @ApiMember(Description="Pays", DataType="string")
    AdrPays: string;

    /**
    * Numéro de téléphone
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de téléphone", DataType="string")
    NumTelep: string;

    /**
    * Numéro de fax
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de fax", DataType="string")
    NumFax: string;

    /**
    * Adresse email
    */
    // @StringLength(100)
    // @ApiMember(Description="Adresse email", DataType="string")
    NumEmail: string;

    /**
    * Code comptabilité
    */
    // @StringLength(100)
    // @ApiMember(Description="Code comptabilité", DataType="string")
    CodCompta: string;

    /**
    * Numéro de client
    */
    // @StringLength(100)
    // @ApiMember(Description="Numéro de client", DataType="string")
    NumClient: string;

    /**
    * Numéro de TVA intracommunautaire
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de TVA intracommunautaire", DataType="string")
    NumTVAIntra: string;

    /**
    * Frais de port
    */
    // @ApiMember(Description="Frais de port", DataType="double")
    MntFPort: number;

    /**
    * Montant minimum pour frais de port gratuits
    */
    // @ApiMember(Description="Montant minimum pour frais de port gratuits", DataType="double")
    MntFPortGratuit: number;

    /**
    * Montant minimum à commander
    */
    // @ApiMember(Description="Montant minimum à commander", DataType="double")
    MntCommandeMin: number;

    /**
    * Délais de livraison en jours
    */
    // @ApiMember(Description="Délais de livraison en jours", DataType="byte")
    DelLivraison: number;

    /**
    * Délais de paiement en jours
    */
    // @ApiMember(Description="Délais de paiement en jours", DataType="byte")
    DelPaiement: number;

    /**
    * Note globale
    */
    // @ApiMember(Description="Note globale", DataType="double")
    ValNote: number;

    /**
    * Mode de règlement
    */
    // @ApiMember(Description="Mode de règlement")
    TypModeReglement: TypModeReglement;

    // @Required()
    // @ApiMember(DataType="boolean", IsRequired=true)
    EstEnvoiMailBonCde: boolean;
    createResponse() { return new Fourn(); }
    getTypeName() { return "Fourn"; }
}

// @Route("/Fourn/{CleFourn}/Banque", "POST")
// @ApiResponse(409, "L'entité FournBanque spécifiée est un doublon")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
export class FournBanque implements IReturn<FournBanque>
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleBanque: number;

    /**
    * Identifiant unique du fournisseur parent
    */
    // @Required()
    // @ApiMember(Description="Identifiant unique du fournisseur parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;

    Fourn: Fourn;
    /**
    * Code IBAN
    */
    // @StringLength(34)
    // @Required()
    // @ApiMember(Description="Code IBAN", DataType="string", IsRequired=true)
    CodIBAN: string;

    /**
    * Code BIC
    */
    // @StringLength(11)
    // @Required()
    // @ApiMember(Description="Code BIC", DataType="string", IsRequired=true)
    CodBIC: string;

    /**
    * Nom de l'établissement bancaire
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Nom de l'établissement bancaire", DataType="string", IsRequired=true)
    LibEtablissement: string;

    /**
    * Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur
    */
    // @Required()
    // @ApiMember(Description="Si true, les coordonnées bancaires sont celles par défaut pour le fournisseur", DataType="boolean", IsRequired=true)
    EstDefaut: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    createResponse() { return new FournBanque(); }
    getTypeName() { return "FournBanque"; }
}

// @Route("/Fourn/{CleFourn}/Contact", "POST")
// @ApiResponse(409, "L'entité FournContact spécifiée est un doublon")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
export class FournContact implements IReturn<FournContact>
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleContact: number;

    /**
    * Identifiant unique du fournisseur parent
    */
    // @Required()
    // @ApiMember(Description="Identifiant unique du fournisseur parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;

    Fourn: Fourn;
    /**
    * Nom de famille
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Nom de famille", DataType="string", IsRequired=true)
    NomContact: string;

    /**
    * Prénom
    */
    // @StringLength(100)
    // @ApiMember(Description="Prénom", DataType="string")
    PreContact: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtContact: string;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Numéro de téléphone
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de téléphone", DataType="string")
    NumTelep: string;

    /**
    * Numéro de fax
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de fax", DataType="string")
    NumFax: string;

    /**
    * Adresse email
    */
    // @StringLength(100)
    // @ApiMember(Description="Adresse email", DataType="string")
    NumEmail: string;

    /**
    * Titre de civilité
    */
    // @ApiMember(Description="Titre de civilité")
    TypCivilite: TypCivilite;

    /**
    * Fonction ou poste du contact chez le fournisseur
    */
    // @StringLength(100)
    // @ApiMember(Description="Fonction ou poste du contact chez le fournisseur", DataType="string")
    LibFonction: string;
    createResponse() { return new FournContact(); }
    getTypeName() { return "FournContact"; }
}

export class SearchFournResponse
{
    ResponseStatus: ResponseStatus;
    Results: BaseEntity[];
}

export class SelectFournResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: Fourn[];
}

export class SelectFournBanqueResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: FournBanque[];
}

export class SelectFournContactResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: FournContact[];
}

// @Route("/Mandat", "POST")
// @ApiResponse(409, "L'entité Mandat spécifiée est un doublon")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
export class Mandat
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleMandat: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodMandat: string;

    /**
    * Désignation
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibMandat: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtMandat: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Type de mandat
    */
    // @Required()
    // @ApiMember(Description="Type de mandat", IsRequired=true)
    TypMandat: TypMandat;

    /**
    * Niveau du mandat
    */
    // @Required()
    // @ApiMember(Description="Niveau du mandat", DataType="byte", IsRequired=true)
    NivMandat: number;

    /**
    * Nombre de signatures requises
    */
    // @Required()
    // @ApiMember(Description="Nombre de signatures requises", DataType="byte", IsRequired=true)
    NbrSignature: number;

    /**
    * Corps du message
    */
    // @ApiMember(Description="Corps du message", DataType="string")
    TxtMessage: string;
}

// @Route("/Personne", "POST")
// @ApiResponse(409, "L'entité Personne spécifiée est un doublon")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
export class Personne
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    ClePersonne: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodPersonne: string;

    /**
    * Nom de famille
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Nom de famille", DataType="string", IsRequired=true)
    NomPersonne: string;

    /**
    * Prénom
    */
    // @StringLength(100)
    // @ApiMember(Description="Prénom", DataType="string")
    PrePersonne: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtPersonne: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Titre de civilité
    */
    // @ApiMember(Description="Titre de civilité")
    TypCivilite: TypCivilite;

    /**
    * Numéro de téléphone
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de téléphone", DataType="string")
    NumTelep: string;

    /**
    * Numéro de fax
    */
    // @StringLength(25)
    // @ApiMember(Description="Numéro de fax", DataType="string")
    NumFax: string;

    /**
    * Adresse email
    */
    // @StringLength(100)
    // @ApiMember(Description="Adresse email", DataType="string")
    NumEmail: string;
}

// @Route("/Mandat/{CleMandat}/Mandataire", "POST")
// @ApiResponse(409, "L'entité MandatMandataire spécifiée est un doublon")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
export class MandatMandataire
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleMandataire: number;

    /**
    * Identifiant unique du mandat parent
    */
    // @Required()
    // @ApiMember(Description="Identifiant unique du mandat parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandat: number;

    Mandat: Mandat;
    /**
    * Identifiant unique de l'utilisateur mandataire
    */
    // @References(typeof(Personne))
    // @Required()
    // @ApiMember(Description="Identifiant unique de l'utilisateur mandataire", DataType="integer", IsRequired=true)
    ClePersonne: number;

    Personne: Personne;
    /**
    * Identifiant unique du service ayant accès au mandat, ou null pour tous les services
    */
    // @References(typeof(Service))
    // @ApiMember(Description="Identifiant unique du service ayant accès au mandat, ou null pour tous les services", DataType="integer")
    CleService: number;

    Service: Service;
    /**
    * Si true, le mandat est suspendu
    */
    // @Required()
    // @ApiMember(Description="Si true, le mandat est suspendu", DataType="boolean", IsRequired=true)
    EstSuspendu: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
}

export class SearchMandatResponse
{
    ResponseStatus: ResponseStatus;
    Results: BaseEntity[];
}

export class SelectMandatResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: Mandat[];
}

export class SelectMandatMandataireResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: MandatMandataire[];
}

// @Route("/Personne/{ClePersonne}/Profil", "POST")
// @ApiResponse(409, "L'entité PersonneProfil spécifiée est un doublon")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
export class PersonneProfil
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleProfil: number;

    /**
    * Identifiant unique de l'utilisateur parent
    */
    // @Required()
    // @ApiMember(Description="Identifiant unique de l'utilisateur parent", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    Personne: Personne;
    /**
    * Code
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code", DataType="string", IsRequired=true)
    CodProfil: string;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant unique du service auquel a accès le profil, ou null pour tous les services
    */
    // @References(typeof(Service))
    // @ApiMember(Description="Identifiant unique du service auquel a accès le profil, ou null pour tous les services", DataType="integer")
    CleService: number;

    Service: Service;
}

// @Route("/Personne/{ClePersonne}/Signature", "POST")
// @ApiResponse(409, "L'entité PersonneSignature spécifiée est un doublon")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
export class PersonneSignature
{
    /**
    * Identifiant unique de l'utilisateur parent
    */
    // @Required()
    // @ApiMember(Description="Identifiant unique de l'utilisateur parent", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    Personne: Personne;
    /**
    * Image de la signature
    */
    // @Required()
    // @ApiMember(Description="Image de la signature", DataType="file", IsRequired=true)
    ImgSignature: number[];

    /**
    * Type MIME de l'image
    */
    // @StringLength(255)
    // @Required()
    // @ApiMember(Description="Type MIME de l'image", DataType="string", IsRequired=true)
    TypMime: string;
}

export class SelectPersonneResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: Personne[];
}

export class SelectPersonneProfilResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: PersonneProfil[];
}

export class SelectPersonneSignatureResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: PersonneSignature[];
}

export class SearchServiceResponse
{
    ResponseStatus: ResponseStatus;
    Results: BaseEntity[];
}

export class SelectServiceResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: Service[];
}

// @Route("/TVA", "POST")
// @ApiResponse(409, "L'entité TVA spécifiée est un doublon")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
export class TVA
{
    /**
    * Identifiant unique (immutable)
    */
    // @ApiMember(Description="Identifiant unique (immutable)", DataType="integer", IsRequired=true)
    CleTVA: number;

    /**
    * Code (unique)
    */
    // @StringLength(100)
    // @Required()
    // @ApiMember(Description="Code (unique)", DataType="string", IsRequired=true)
    CodTVA: string;

    /**
    * Désignation
    */
    // @StringLength(200)
    // @Required()
    // @ApiMember(Description="Désignation", DataType="string", IsRequired=true)
    LibTVA: string;

    /**
    * Commentaire ou description
    */
    // @StringLength(500)
    // @ApiMember(Description="Commentaire ou description", DataType="string")
    TxtTVA: string;

    /**
    * Actif ou inactif
    */
    // @Required()
    // @ApiMember(Description="Actif ou inactif", DataType="boolean", IsRequired=true)
    EstActif: boolean;

    // @Required()
    DatCreation: string;

    // @Required()
    CleCreateur: number;

    DatEdition: string;
    CleEditeur: number;
    /**
    * Identifiant de synchronisation externe
    */
    // @StringLength(100)
    // @ApiMember(Description="Identifiant de synchronisation externe", DataType="string")
    CodExterne: string;

    /**
    * Taux de TVA
    */
    // @Required()
    // @ApiMember(Description="Taux de TVA", DataType="double", IsRequired=true)
    TauTVA: number;
}

export class SearchTVAResponse
{
    ResponseStatus: ResponseStatus;
    Results: BaseEntity[];
}

export class SelectTVAResponse
{
    ResponseStatus: ResponseStatus;
    TotalCount: number;
    Results: TVA[];
}

// @Route("/Compteur/{CleCompteur}", "DELETE")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
export class DeleteCompteur implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleCompteur: number;
    createResponse() {}
    getTypeName() { return "DeleteCompteur"; }
}

// @Route("/Compteur/Valeur/{CleValeur}", "DELETE")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
export class DeleteCompteurValeur implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleValeur: number;
    createResponse() {}
    getTypeName() { return "DeleteCompteurValeur"; }
}

// @Route("/Compteur/{CleCompteur}", "GET")
// @ApiResponse(400, "L'entité Compteur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
export class GetCompteur implements IReturn<Compteur>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleCompteur: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new Compteur(); }
    getTypeName() { return "GetCompteur"; }
}

// @Route("/Compteur/Valeur/{CleValeur}", "GET")
// @ApiResponse(400, "L'entité CompteurValeur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
export class GetCompteurValeur implements IReturn<CompteurValeur>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleValeur: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new CompteurValeur(); }
    getTypeName() { return "GetCompteurValeur"; }
}

// @Route("/Compteur/{CleCompteur}", "PATCH")
// @ApiResponse(400, "L'entité Compteur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
// @ApiResponse(409, "L'entité Compteur spécifiée est un doublon")
export class PatchCompteur implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleCompteur: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchCompteur"; }
}

// @Route("/Compteur/Valeur/{CleValeur}", "PATCH")
// @ApiResponse(400, "L'entité CompteurValeur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
// @ApiResponse(409, "L'entité CompteurValeur spécifiée est un doublon")
export class PatchCompteurValeur implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleValeur: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchCompteurValeur"; }
}

// @Route("/Compteur/Recherche/{Text}", "GET")
export class SearchCompteur implements IReturn<SearchCompteurResponse>
{
    /**
    * Texte à rechercher
    */
    // @ApiMember(Description="Texte à rechercher", DataType="string", IsRequired=true, ParameterType="path")
    Text: string;

    /**
    * Nombre maximum de résultats à retourner
    */
    // @ApiMember(Description="Nombre maximum de résultats à retourner", DataType="integer")
    Max: number;
    createResponse() { return new SearchCompteurResponse(); }
    getTypeName() { return "SearchCompteur"; }
}

// @Route("/Compteur", "GET")
// @ApiResponse(400, "L'entité Compteur ne contient pas tous les champs demandés")
export class SelectCompteur implements IReturn<SelectCompteurResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectCompteurResponse(); }
    getTypeName() { return "SelectCompteur"; }
}

// @Route("/Compteur/{CleCompteur}/Valeur", "GET")
// @ApiResponse(400, "L'entité CompteurValeur ne contient pas tous les champs demandés")
export class SelectCompteurValeur implements IReturn<SelectCompteurValeurResponse>
{
    /**
    * Identifiant unique du compteur parent
    */
    // @ApiMember(Description="Identifiant unique du compteur parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleCompteur: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectCompteurValeurResponse(); }
    getTypeName() { return "SelectCompteurValeur"; }
}

// @Route("/Exercice/{CleExercice}", "DELETE")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
export class DeleteExercice implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleExercice: number;
    createResponse() {}
    getTypeName() { return "DeleteExercice"; }
}

// @Route("/Exercice/{CleExercice}", "GET")
// @ApiResponse(400, "L'entité Exercice ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
export class GetExercice implements IReturn<Exercice>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleExercice: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new Exercice(); }
    getTypeName() { return "GetExercice"; }
}

// @Route("/Exercice/{CleExercice}", "PATCH")
// @ApiResponse(400, "L'entité Exercice ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
// @ApiResponse(409, "L'entité Exercice spécifiée est un doublon")
export class PatchExercice implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleExercice: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchExercice"; }
}

// @Route("/Exercice/Recherche/{Text}", "GET")
export class SearchExercice implements IReturn<SearchExerciceResponse>
{
    /**
    * Texte à rechercher
    */
    // @ApiMember(Description="Texte à rechercher", DataType="string", IsRequired=true, ParameterType="path")
    Text: string;

    /**
    * Nombre maximum de résultats à retourner
    */
    // @ApiMember(Description="Nombre maximum de résultats à retourner", DataType="integer")
    Max: number;
    createResponse() { return new SearchExerciceResponse(); }
    getTypeName() { return "SearchExercice"; }
}

// @Route("/Exercice", "GET")
// @ApiResponse(400, "L'entité Exercice ne contient pas tous les champs demandés")
export class SelectExercice implements IReturn<SelectExerciceResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectExerciceResponse(); }
    getTypeName() { return "SelectExercice"; }
}

// @Route("/Fourn/{CleFourn}", "DELETE")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
export class DeleteFourn implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;
    createResponse() {}
    getTypeName() { return "DeleteFourn"; }
}

// @Route("/Fourn/Banque/{CleBanque}", "DELETE")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
export class DeleteFournBanque implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleBanque: number;
    createResponse() {}
    getTypeName() { return "DeleteFournBanque"; }
}

// @Route("/Fourn/Contact/{CleContact}", "DELETE")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
export class DeleteFournContact implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleContact: number;
    createResponse() {}
    getTypeName() { return "DeleteFournContact"; }
}

// @Route("/Fourn/{CleFourn}", "GET")
// @ApiResponse(400, "L'entité Fourn ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
export class GetFourn implements IReturn<Fourn>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new Fourn(); }
    getTypeName() { return "GetFourn"; }
}

// @Route("/Fourn/Banque/{CleBanque}", "GET")
// @ApiResponse(400, "L'entité FournBanque ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
export class GetFournBanque implements IReturn<FournBanque>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleBanque: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new FournBanque(); }
    getTypeName() { return "GetFournBanque"; }
}

// @Route("/Fourn/Contact/{CleContact}", "GET")
// @ApiResponse(400, "L'entité FournContact ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
export class GetFournContact implements IReturn<FournContact>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleContact: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new FournContact(); }
    getTypeName() { return "GetFournContact"; }
}

// @Route("/Fourn/{CleFourn}", "PATCH")
// @ApiResponse(400, "L'entité Fourn ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
// @ApiResponse(409, "L'entité Fourn spécifiée est un doublon")
export class PatchFourn implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchFourn"; }
}

// @Route("/Fourn/Banque/{CleBanque}", "PATCH")
// @ApiResponse(400, "L'entité FournBanque ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
// @ApiResponse(409, "L'entité FournBanque spécifiée est un doublon")
export class PatchFournBanque implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleBanque: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchFournBanque"; }
}

// @Route("/Fourn/Contact/{CleContact}", "PATCH")
// @ApiResponse(400, "L'entité FournContact ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
// @ApiResponse(409, "L'entité FournContact spécifiée est un doublon")
export class PatchFournContact implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleContact: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchFournContact"; }
}

// @Route("/Fourn/Recherche/{Text}", "GET")
export class SearchFourn implements IReturn<SearchFournResponse>
{
    /**
    * Texte à rechercher
    */
    // @ApiMember(Description="Texte à rechercher", DataType="string", IsRequired=true, ParameterType="path")
    Text: string;

    /**
    * Nombre maximum de résultats à retourner
    */
    // @ApiMember(Description="Nombre maximum de résultats à retourner", DataType="integer")
    Max: number;
    createResponse() { return new SearchFournResponse(); }
    getTypeName() { return "SearchFourn"; }
}

// @Route("/Fourn", "GET")
// @ApiResponse(400, "L'entité Fourn ne contient pas tous les champs demandés")
export class SelectFourn implements IReturn<SelectFournResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectFournResponse(); }
    getTypeName() { return "SelectFourn"; }
}

// @Route("/Fourn/{CleFourn}/Banque", "GET")
// @ApiResponse(400, "L'entité FournBanque ne contient pas tous les champs demandés")
export class SelectFournBanque implements IReturn<SelectFournBanqueResponse>
{
    /**
    * Identifiant unique du fournisseur parent
    */
    // @ApiMember(Description="Identifiant unique du fournisseur parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectFournBanqueResponse(); }
    getTypeName() { return "SelectFournBanque"; }
}

// @Route("/Fourn/{CleFourn}/Contact", "GET")
// @ApiResponse(400, "L'entité FournContact ne contient pas tous les champs demandés")
export class SelectFournContact implements IReturn<SelectFournContactResponse>
{
    /**
    * Identifiant unique du fournisseur parent
    */
    // @ApiMember(Description="Identifiant unique du fournisseur parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleFourn: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectFournContactResponse(); }
    getTypeName() { return "SelectFournContact"; }
}

// @Route("/Mandat/{CleMandat}", "DELETE")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
export class DeleteMandat implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandat: number;
    createResponse() {}
    getTypeName() { return "DeleteMandat"; }
}

// @Route("/Mandat/Mandataire/{CleMandataire}", "DELETE")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
export class DeleteMandatMandataire implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandataire: number;
    createResponse() {}
    getTypeName() { return "DeleteMandatMandataire"; }
}

// @Route("/Mandat/{CleMandat}", "GET")
// @ApiResponse(400, "L'entité Mandat ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
export class GetMandat implements IReturn<Mandat>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandat: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new Mandat(); }
    getTypeName() { return "GetMandat"; }
}

// @Route("/Mandat/Mandataire/{CleMandataire}", "GET")
// @ApiResponse(400, "L'entité MandatMandataire ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
export class GetMandatMandataire implements IReturn<MandatMandataire>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandataire: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new MandatMandataire(); }
    getTypeName() { return "GetMandatMandataire"; }
}

// @Route("/Mandat/{CleMandat}", "PATCH")
// @ApiResponse(400, "L'entité Mandat ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
// @ApiResponse(409, "L'entité Mandat spécifiée est un doublon")
export class PatchMandat implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandat: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchMandat"; }
}

// @Route("/Mandat/Mandataire/{CleMandataire}", "PATCH")
// @ApiResponse(400, "L'entité MandatMandataire ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
// @ApiResponse(409, "L'entité MandatMandataire spécifiée est un doublon")
export class PatchMandatMandataire implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandataire: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchMandatMandataire"; }
}

// @Route("/Mandat/Recherche/{Text}", "GET")
export class SearchMandat implements IReturn<SearchMandatResponse>
{
    /**
    * Texte à rechercher
    */
    // @ApiMember(Description="Texte à rechercher", DataType="string", IsRequired=true, ParameterType="path")
    Text: string;

    /**
    * Nombre maximum de résultats à retourner
    */
    // @ApiMember(Description="Nombre maximum de résultats à retourner", DataType="integer")
    Max: number;
    createResponse() { return new SearchMandatResponse(); }
    getTypeName() { return "SearchMandat"; }
}

// @Route("/Mandat", "GET")
// @ApiResponse(400, "L'entité Mandat ne contient pas tous les champs demandés")
export class SelectMandat implements IReturn<SelectMandatResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectMandatResponse(); }
    getTypeName() { return "SelectMandat"; }
}

// @Route("/Mandat/{CleMandat}/Mandataire", "GET")
// @ApiResponse(400, "L'entité MandatMandataire ne contient pas tous les champs demandés")
export class SelectMandatMandataire implements IReturn<SelectMandatMandataireResponse>
{
    /**
    * Identifiant unique du mandat parent
    */
    // @ApiMember(Description="Identifiant unique du mandat parent", DataType="integer", IsRequired=true, ParameterType="path")
    CleMandat: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectMandatMandataireResponse(); }
    getTypeName() { return "SelectMandatMandataire"; }
}

// @Route("/Personne/{ClePersonne}", "DELETE")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
export class DeletePersonne implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;
    createResponse() {}
    getTypeName() { return "DeletePersonne"; }
}

// @Route("/Personne/Profil/{CleProfil}", "DELETE")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
export class DeletePersonneProfil implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleProfil: number;
    createResponse() {}
    getTypeName() { return "DeletePersonneProfil"; }
}

// @Route("/Personne/Signature/{ClePersonne}", "DELETE")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
export class DeletePersonneSignature implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;
    createResponse() {}
    getTypeName() { return "DeletePersonneSignature"; }
}

// @Route("/Personne/{ClePersonne}", "GET")
// @ApiResponse(400, "L'entité Personne ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
export class GetPersonne implements IReturn<Personne>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new Personne(); }
    getTypeName() { return "GetPersonne"; }
}

// @Route("/Personne/Profil/{CleProfil}", "GET")
// @ApiResponse(400, "L'entité PersonneProfil ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
export class GetPersonneProfil implements IReturn<PersonneProfil>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleProfil: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new PersonneProfil(); }
    getTypeName() { return "GetPersonneProfil"; }
}

// @Route("/Personne/Signature/{ClePersonne}", "GET")
// @ApiResponse(400, "L'entité PersonneSignature ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
export class GetPersonneSignature implements IReturn<PersonneSignature>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new PersonneSignature(); }
    getTypeName() { return "GetPersonneSignature"; }
}

// @Route("/Personne/{ClePersonne}", "PATCH")
// @ApiResponse(400, "L'entité Personne ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
// @ApiResponse(409, "L'entité Personne spécifiée est un doublon")
export class PatchPersonne implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchPersonne"; }
}

// @Route("/Personne/Profil/{CleProfil}", "PATCH")
// @ApiResponse(400, "L'entité PersonneProfil ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
// @ApiResponse(409, "L'entité PersonneProfil spécifiée est un doublon")
export class PatchPersonneProfil implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleProfil: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchPersonneProfil"; }
}

// @Route("/Personne/Signature/{ClePersonne}", "PATCH")
// @ApiResponse(400, "L'entité PersonneSignature ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
// @ApiResponse(409, "L'entité PersonneSignature spécifiée est un doublon")
export class PatchPersonneSignature implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchPersonneSignature"; }
}

// @Route("/Personne", "GET")
// @ApiResponse(400, "L'entité Personne ne contient pas tous les champs demandés")
export class SelectPersonne implements IReturn<SelectPersonneResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectPersonneResponse(); }
    getTypeName() { return "SelectPersonne"; }
}

// @Route("/Personne/{ClePersonne}/Profil", "GET")
// @ApiResponse(400, "L'entité PersonneProfil ne contient pas tous les champs demandés")
export class SelectPersonneProfil implements IReturn<SelectPersonneProfilResponse>
{
    /**
    * Identifiant unique de l'utilisateur parent
    */
    // @ApiMember(Description="Identifiant unique de l'utilisateur parent", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectPersonneProfilResponse(); }
    getTypeName() { return "SelectPersonneProfil"; }
}

// @Route("/Personne/{ClePersonne}/Signature", "GET")
// @ApiResponse(400, "L'entité PersonneSignature ne contient pas tous les champs demandés")
export class SelectPersonneSignature implements IReturn<SelectPersonneSignatureResponse>
{
    /**
    * Identifiant unique de l'utilisateur parent
    */
    // @ApiMember(Description="Identifiant unique de l'utilisateur parent", DataType="integer", IsRequired=true, ParameterType="path")
    ClePersonne: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectPersonneSignatureResponse(); }
    getTypeName() { return "SelectPersonneSignature"; }
}

// @Route("/Service/{CleService}", "DELETE")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
export class DeleteService implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(ParameterType="path", Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true)
    CleService: number;
    createResponse() {}
    getTypeName() { return "DeleteService"; }
}

// @Route("/Service/{CleService}", "GET")
// @ApiResponse(400, "L'entité Service ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
export class GetService implements IReturn<Service>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleService: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new Service(); }
    getTypeName() { return "GetService"; }
}

// @Route("/Service/{CleService}", "PATCH")
// @ApiResponse(400, "L'entité Service ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
// @ApiResponse(409, "L'entité Service spécifiée est un doublon")
export class PatchService implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleService: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchService"; }
}

// @Route("/Service/Recherche/{Text}", "GET")
export class SearchService implements IReturn<SearchServiceResponse>
{
    /**
    * Texte à rechercher
    */
    // @ApiMember(Description="Texte à rechercher", DataType="string", IsRequired=true, ParameterType="path")
    Text: string;

    /**
    * Nombre maximum de résultats à retourner
    */
    // @ApiMember(Description="Nombre maximum de résultats à retourner", DataType="integer")
    Max: number;
    createResponse() { return new SearchServiceResponse(); }
    getTypeName() { return "SearchService"; }
}

// @Route("/Service", "GET")
// @ApiResponse(400, "L'entité Service ne contient pas tous les champs demandés")
export class SelectService implements IReturn<SelectServiceResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectServiceResponse(); }
    getTypeName() { return "SelectService"; }
}

// @Route("/TVA/{CleTVA}", "DELETE")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
export class DeleteTVA implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à supprimer
    */
    // @ApiMember(Description="Identifiant unique de l'entité à supprimer", DataType="integer", IsRequired=true, ParameterType="path")
    CleTVA: number;
    createResponse() {}
    getTypeName() { return "DeleteTVA"; }
}

// @Route("/TVA/{CleTVA}", "GET")
// @ApiResponse(400, "L'entité TVA ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
export class GetTVA implements IReturn<TVA>
{
    /**
    * Identifiant unique de l'entité à retourner
    */
    // @ApiMember(Description="Identifiant unique de l'entité à retourner", DataType="integer", IsRequired=true, ParameterType="path")
    CleTVA: number;

    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;
    createResponse() { return new TVA(); }
    getTypeName() { return "GetTVA"; }
}

// @Route("/TVA/{CleTVA}", "PATCH")
// @ApiResponse(400, "L'entité TVA ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
// @ApiResponse(409, "L'entité TVA spécifiée est un doublon")
export class PatchTVA implements IReturnVoid
{
    /**
    * Identifiant unique de l'entité à modifier
    */
    // @ApiMember(Description="Identifiant unique de l'entité à modifier", DataType="integer", IsRequired=true, ParameterType="path")
    CleTVA: number;

    /**
    * Liste des modifications à appliquer
    */
    // @ApiMember(Description="Liste des modifications à appliquer", DataType="Array[Patch]", IsRequired=true, ParameterType="form")
    Operations: Patch[];
    createResponse() {}
    getTypeName() { return "PatchTVA"; }
}

// @Route("/TVA/Recherche/{Text}", "GET")
export class SearchTVA implements IReturn<SearchTVAResponse>
{
    /**
    * Texte à rechercher
    */
    // @ApiMember(Description="Texte à rechercher", DataType="string", IsRequired=true, ParameterType="path")
    Text: string;

    /**
    * Nombre maximum de résultats à retourner
    */
    // @ApiMember(Description="Nombre maximum de résultats à retourner", DataType="integer")
    Max: number;
    createResponse() { return new SearchTVAResponse(); }
    getTypeName() { return "SearchTVA"; }
}

// @Route("/TVA", "GET")
// @ApiResponse(400, "L'entité TVA ne contient pas tous les champs demandés")
export class SelectTVA implements IReturn<SelectTVAResponse>
{
    /**
    * Champs à retourner, ou null pour retourner tous les champs
    */
    // @ApiMember(Description="Champs à retourner, ou null pour retourner tous les champs", DataType="string")
    Fields: string;

    /**
    * Nombre d'éléments à ignorer avant de retourner les éléments restants
    */
    // @ApiMember(Description="Nombre d'éléments à ignorer avant de retourner les éléments restants", DataType="integer")
    Skip: number;

    /**
    * Nombre d'éléments à retourner
    */
    // @ApiMember(Description="Nombre d'éléments à retourner", DataType="integer")
    Take: number;

    /**
    * Ordre de tri
    */
    // @ApiMember(Description="Ordre de tri", DataType="Array[string]")
    Sort: string[];
    createResponse() { return new SelectTVAResponse(); }
    getTypeName() { return "SelectTVA"; }
}
