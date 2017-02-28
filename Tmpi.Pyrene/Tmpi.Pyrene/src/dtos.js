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
"use strict";
var Patch = (function () {
    function Patch() {
    }
    return Patch;
}());
exports.Patch = Patch;
// @DataContract
var ResponseError = (function () {
    function ResponseError() {
    }
    return ResponseError;
}());
exports.ResponseError = ResponseError;
// @DataContract
var ResponseStatus = (function () {
    function ResponseStatus() {
    }
    return ResponseStatus;
}());
exports.ResponseStatus = ResponseStatus;
var BaseEntity = (function () {
    function BaseEntity() {
    }
    return BaseEntity;
}());
exports.BaseEntity = BaseEntity;
// @Route("/Service", "POST")
// @ApiResponse(409, "L'entité Service spécifiée est un doublon")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
var Service = (function () {
    function Service() {
    }
    return Service;
}());
exports.Service = Service;
// @Route("/Compteur", "POST")
// @ApiResponse(409, "L'entité Compteur spécifiée est un doublon")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
var Compteur = (function () {
    function Compteur() {
    }
    Compteur.prototype.createResponse = function () { return new Compteur(); };
    Compteur.prototype.getTypeName = function () { return "Compteur"; };
    return Compteur;
}());
exports.Compteur = Compteur;
// @Route("/Compteur/{CleCompteur}/Valeur", "POST")
// @ApiResponse(409, "L'entité CompteurValeur spécifiée est un doublon")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
var CompteurValeur = (function () {
    function CompteurValeur() {
    }
    CompteurValeur.prototype.createResponse = function () { return new CompteurValeur(); };
    CompteurValeur.prototype.getTypeName = function () { return "CompteurValeur"; };
    return CompteurValeur;
}());
exports.CompteurValeur = CompteurValeur;
var SearchCompteurResponse = (function () {
    function SearchCompteurResponse() {
    }
    return SearchCompteurResponse;
}());
exports.SearchCompteurResponse = SearchCompteurResponse;
var SelectCompteurResponse = (function () {
    function SelectCompteurResponse() {
    }
    return SelectCompteurResponse;
}());
exports.SelectCompteurResponse = SelectCompteurResponse;
var SelectCompteurValeurResponse = (function () {
    function SelectCompteurValeurResponse() {
    }
    return SelectCompteurValeurResponse;
}());
exports.SelectCompteurValeurResponse = SelectCompteurValeurResponse;
// @Route("/Exercice", "POST")
// @ApiResponse(409, "L'entité Exercice spécifiée est un doublon")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
var Exercice = (function () {
    function Exercice() {
    }
    Exercice.prototype.createResponse = function () { return new Exercice(); };
    Exercice.prototype.getTypeName = function () { return "Exercice"; };
    return Exercice;
}());
exports.Exercice = Exercice;
var SearchExerciceResponse = (function () {
    function SearchExerciceResponse() {
    }
    return SearchExerciceResponse;
}());
exports.SearchExerciceResponse = SearchExerciceResponse;
var SelectExerciceResponse = (function () {
    function SelectExerciceResponse() {
    }
    return SelectExerciceResponse;
}());
exports.SelectExerciceResponse = SelectExerciceResponse;
// @Route("/Fourn", "POST")
// @ApiResponse(409, "L'entité Fourn spécifiée est un doublon")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
var Fourn = (function () {
    function Fourn() {
    }
    Fourn.prototype.createResponse = function () { return new Fourn(); };
    Fourn.prototype.getTypeName = function () { return "Fourn"; };
    return Fourn;
}());
exports.Fourn = Fourn;
// @Route("/Fourn/{CleFourn}/Banque", "POST")
// @ApiResponse(409, "L'entité FournBanque spécifiée est un doublon")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
var FournBanque = (function () {
    function FournBanque() {
    }
    FournBanque.prototype.createResponse = function () { return new FournBanque(); };
    FournBanque.prototype.getTypeName = function () { return "FournBanque"; };
    return FournBanque;
}());
exports.FournBanque = FournBanque;
// @Route("/Fourn/{CleFourn}/Contact", "POST")
// @ApiResponse(409, "L'entité FournContact spécifiée est un doublon")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
var FournContact = (function () {
    function FournContact() {
    }
    FournContact.prototype.createResponse = function () { return new FournContact(); };
    FournContact.prototype.getTypeName = function () { return "FournContact"; };
    return FournContact;
}());
exports.FournContact = FournContact;
var SearchFournResponse = (function () {
    function SearchFournResponse() {
    }
    return SearchFournResponse;
}());
exports.SearchFournResponse = SearchFournResponse;
var SelectFournResponse = (function () {
    function SelectFournResponse() {
    }
    return SelectFournResponse;
}());
exports.SelectFournResponse = SelectFournResponse;
var SelectFournBanqueResponse = (function () {
    function SelectFournBanqueResponse() {
    }
    return SelectFournBanqueResponse;
}());
exports.SelectFournBanqueResponse = SelectFournBanqueResponse;
var SelectFournContactResponse = (function () {
    function SelectFournContactResponse() {
    }
    return SelectFournContactResponse;
}());
exports.SelectFournContactResponse = SelectFournContactResponse;
// @Route("/Mandat", "POST")
// @ApiResponse(409, "L'entité Mandat spécifiée est un doublon")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
var Mandat = (function () {
    function Mandat() {
    }
    return Mandat;
}());
exports.Mandat = Mandat;
// @Route("/Personne", "POST")
// @ApiResponse(409, "L'entité Personne spécifiée est un doublon")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
var Personne = (function () {
    function Personne() {
    }
    return Personne;
}());
exports.Personne = Personne;
// @Route("/Mandat/{CleMandat}/Mandataire", "POST")
// @ApiResponse(409, "L'entité MandatMandataire spécifiée est un doublon")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
var MandatMandataire = (function () {
    function MandatMandataire() {
    }
    return MandatMandataire;
}());
exports.MandatMandataire = MandatMandataire;
var SearchMandatResponse = (function () {
    function SearchMandatResponse() {
    }
    return SearchMandatResponse;
}());
exports.SearchMandatResponse = SearchMandatResponse;
var SelectMandatResponse = (function () {
    function SelectMandatResponse() {
    }
    return SelectMandatResponse;
}());
exports.SelectMandatResponse = SelectMandatResponse;
var SelectMandatMandataireResponse = (function () {
    function SelectMandatMandataireResponse() {
    }
    return SelectMandatMandataireResponse;
}());
exports.SelectMandatMandataireResponse = SelectMandatMandataireResponse;
// @Route("/Personne/{ClePersonne}/Profil", "POST")
// @ApiResponse(409, "L'entité PersonneProfil spécifiée est un doublon")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
var PersonneProfil = (function () {
    function PersonneProfil() {
    }
    return PersonneProfil;
}());
exports.PersonneProfil = PersonneProfil;
// @Route("/Personne/{ClePersonne}/Signature", "POST")
// @ApiResponse(409, "L'entité PersonneSignature spécifiée est un doublon")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
var PersonneSignature = (function () {
    function PersonneSignature() {
    }
    return PersonneSignature;
}());
exports.PersonneSignature = PersonneSignature;
var SelectPersonneResponse = (function () {
    function SelectPersonneResponse() {
    }
    return SelectPersonneResponse;
}());
exports.SelectPersonneResponse = SelectPersonneResponse;
var SelectPersonneProfilResponse = (function () {
    function SelectPersonneProfilResponse() {
    }
    return SelectPersonneProfilResponse;
}());
exports.SelectPersonneProfilResponse = SelectPersonneProfilResponse;
var SelectPersonneSignatureResponse = (function () {
    function SelectPersonneSignatureResponse() {
    }
    return SelectPersonneSignatureResponse;
}());
exports.SelectPersonneSignatureResponse = SelectPersonneSignatureResponse;
var SearchServiceResponse = (function () {
    function SearchServiceResponse() {
    }
    return SearchServiceResponse;
}());
exports.SearchServiceResponse = SearchServiceResponse;
var SelectServiceResponse = (function () {
    function SelectServiceResponse() {
    }
    return SelectServiceResponse;
}());
exports.SelectServiceResponse = SelectServiceResponse;
// @Route("/TVA", "POST")
// @ApiResponse(409, "L'entité TVA spécifiée est un doublon")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
var TVA = (function () {
    function TVA() {
    }
    return TVA;
}());
exports.TVA = TVA;
var SearchTVAResponse = (function () {
    function SearchTVAResponse() {
    }
    return SearchTVAResponse;
}());
exports.SearchTVAResponse = SearchTVAResponse;
var SelectTVAResponse = (function () {
    function SelectTVAResponse() {
    }
    return SelectTVAResponse;
}());
exports.SelectTVAResponse = SelectTVAResponse;
// @Route("/Compteur/{CleCompteur}", "DELETE")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
var DeleteCompteur = (function () {
    function DeleteCompteur() {
    }
    DeleteCompteur.prototype.createResponse = function () { };
    DeleteCompteur.prototype.getTypeName = function () { return "DeleteCompteur"; };
    return DeleteCompteur;
}());
exports.DeleteCompteur = DeleteCompteur;
// @Route("/Compteur/Valeur/{CleValeur}", "DELETE")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
var DeleteCompteurValeur = (function () {
    function DeleteCompteurValeur() {
    }
    DeleteCompteurValeur.prototype.createResponse = function () { };
    DeleteCompteurValeur.prototype.getTypeName = function () { return "DeleteCompteurValeur"; };
    return DeleteCompteurValeur;
}());
exports.DeleteCompteurValeur = DeleteCompteurValeur;
// @Route("/Compteur/{CleCompteur}", "GET")
// @ApiResponse(400, "L'entité Compteur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
var GetCompteur = (function () {
    function GetCompteur() {
    }
    GetCompteur.prototype.createResponse = function () { return new Compteur(); };
    GetCompteur.prototype.getTypeName = function () { return "GetCompteur"; };
    return GetCompteur;
}());
exports.GetCompteur = GetCompteur;
// @Route("/Compteur/Valeur/{CleValeur}", "GET")
// @ApiResponse(400, "L'entité CompteurValeur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
var GetCompteurValeur = (function () {
    function GetCompteurValeur() {
    }
    GetCompteurValeur.prototype.createResponse = function () { return new CompteurValeur(); };
    GetCompteurValeur.prototype.getTypeName = function () { return "GetCompteurValeur"; };
    return GetCompteurValeur;
}());
exports.GetCompteurValeur = GetCompteurValeur;
// @Route("/Compteur/{CleCompteur}", "PATCH")
// @ApiResponse(400, "L'entité Compteur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Compteur spécifiée est introuvable")
// @ApiResponse(409, "L'entité Compteur spécifiée est un doublon")
var PatchCompteur = (function () {
    function PatchCompteur() {
    }
    PatchCompteur.prototype.createResponse = function () { };
    PatchCompteur.prototype.getTypeName = function () { return "PatchCompteur"; };
    return PatchCompteur;
}());
exports.PatchCompteur = PatchCompteur;
// @Route("/Compteur/Valeur/{CleValeur}", "PATCH")
// @ApiResponse(400, "L'entité CompteurValeur ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité CompteurValeur spécifiée est introuvable")
// @ApiResponse(409, "L'entité CompteurValeur spécifiée est un doublon")
var PatchCompteurValeur = (function () {
    function PatchCompteurValeur() {
    }
    PatchCompteurValeur.prototype.createResponse = function () { };
    PatchCompteurValeur.prototype.getTypeName = function () { return "PatchCompteurValeur"; };
    return PatchCompteurValeur;
}());
exports.PatchCompteurValeur = PatchCompteurValeur;
// @Route("/Compteur/Recherche/{Text}", "GET")
var SearchCompteur = (function () {
    function SearchCompteur() {
    }
    SearchCompteur.prototype.createResponse = function () { return new SearchCompteurResponse(); };
    SearchCompteur.prototype.getTypeName = function () { return "SearchCompteur"; };
    return SearchCompteur;
}());
exports.SearchCompteur = SearchCompteur;
// @Route("/Compteur", "GET")
// @ApiResponse(400, "L'entité Compteur ne contient pas tous les champs demandés")
var SelectCompteur = (function () {
    function SelectCompteur() {
    }
    SelectCompteur.prototype.createResponse = function () { return new SelectCompteurResponse(); };
    SelectCompteur.prototype.getTypeName = function () { return "SelectCompteur"; };
    return SelectCompteur;
}());
exports.SelectCompteur = SelectCompteur;
// @Route("/Compteur/{CleCompteur}/Valeur", "GET")
// @ApiResponse(400, "L'entité CompteurValeur ne contient pas tous les champs demandés")
var SelectCompteurValeur = (function () {
    function SelectCompteurValeur() {
    }
    SelectCompteurValeur.prototype.createResponse = function () { return new SelectCompteurValeurResponse(); };
    SelectCompteurValeur.prototype.getTypeName = function () { return "SelectCompteurValeur"; };
    return SelectCompteurValeur;
}());
exports.SelectCompteurValeur = SelectCompteurValeur;
// @Route("/Exercice/{CleExercice}", "DELETE")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
var DeleteExercice = (function () {
    function DeleteExercice() {
    }
    DeleteExercice.prototype.createResponse = function () { };
    DeleteExercice.prototype.getTypeName = function () { return "DeleteExercice"; };
    return DeleteExercice;
}());
exports.DeleteExercice = DeleteExercice;
// @Route("/Exercice/{CleExercice}", "GET")
// @ApiResponse(400, "L'entité Exercice ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
var GetExercice = (function () {
    function GetExercice() {
    }
    GetExercice.prototype.createResponse = function () { return new Exercice(); };
    GetExercice.prototype.getTypeName = function () { return "GetExercice"; };
    return GetExercice;
}());
exports.GetExercice = GetExercice;
// @Route("/Exercice/{CleExercice}", "PATCH")
// @ApiResponse(400, "L'entité Exercice ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Exercice spécifiée est introuvable")
// @ApiResponse(409, "L'entité Exercice spécifiée est un doublon")
var PatchExercice = (function () {
    function PatchExercice() {
    }
    PatchExercice.prototype.createResponse = function () { };
    PatchExercice.prototype.getTypeName = function () { return "PatchExercice"; };
    return PatchExercice;
}());
exports.PatchExercice = PatchExercice;
// @Route("/Exercice/Recherche/{Text}", "GET")
var SearchExercice = (function () {
    function SearchExercice() {
    }
    SearchExercice.prototype.createResponse = function () { return new SearchExerciceResponse(); };
    SearchExercice.prototype.getTypeName = function () { return "SearchExercice"; };
    return SearchExercice;
}());
exports.SearchExercice = SearchExercice;
// @Route("/Exercice", "GET")
// @ApiResponse(400, "L'entité Exercice ne contient pas tous les champs demandés")
var SelectExercice = (function () {
    function SelectExercice() {
    }
    SelectExercice.prototype.createResponse = function () { return new SelectExerciceResponse(); };
    SelectExercice.prototype.getTypeName = function () { return "SelectExercice"; };
    return SelectExercice;
}());
exports.SelectExercice = SelectExercice;
// @Route("/Fourn/{CleFourn}", "DELETE")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
var DeleteFourn = (function () {
    function DeleteFourn() {
    }
    DeleteFourn.prototype.createResponse = function () { };
    DeleteFourn.prototype.getTypeName = function () { return "DeleteFourn"; };
    return DeleteFourn;
}());
exports.DeleteFourn = DeleteFourn;
// @Route("/Fourn/Banque/{CleBanque}", "DELETE")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
var DeleteFournBanque = (function () {
    function DeleteFournBanque() {
    }
    DeleteFournBanque.prototype.createResponse = function () { };
    DeleteFournBanque.prototype.getTypeName = function () { return "DeleteFournBanque"; };
    return DeleteFournBanque;
}());
exports.DeleteFournBanque = DeleteFournBanque;
// @Route("/Fourn/Contact/{CleContact}", "DELETE")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
var DeleteFournContact = (function () {
    function DeleteFournContact() {
    }
    DeleteFournContact.prototype.createResponse = function () { };
    DeleteFournContact.prototype.getTypeName = function () { return "DeleteFournContact"; };
    return DeleteFournContact;
}());
exports.DeleteFournContact = DeleteFournContact;
// @Route("/Fourn/{CleFourn}", "GET")
// @ApiResponse(400, "L'entité Fourn ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
var GetFourn = (function () {
    function GetFourn() {
    }
    GetFourn.prototype.createResponse = function () { return new Fourn(); };
    GetFourn.prototype.getTypeName = function () { return "GetFourn"; };
    return GetFourn;
}());
exports.GetFourn = GetFourn;
// @Route("/Fourn/Banque/{CleBanque}", "GET")
// @ApiResponse(400, "L'entité FournBanque ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
var GetFournBanque = (function () {
    function GetFournBanque() {
    }
    GetFournBanque.prototype.createResponse = function () { return new FournBanque(); };
    GetFournBanque.prototype.getTypeName = function () { return "GetFournBanque"; };
    return GetFournBanque;
}());
exports.GetFournBanque = GetFournBanque;
// @Route("/Fourn/Contact/{CleContact}", "GET")
// @ApiResponse(400, "L'entité FournContact ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
var GetFournContact = (function () {
    function GetFournContact() {
    }
    GetFournContact.prototype.createResponse = function () { return new FournContact(); };
    GetFournContact.prototype.getTypeName = function () { return "GetFournContact"; };
    return GetFournContact;
}());
exports.GetFournContact = GetFournContact;
// @Route("/Fourn/{CleFourn}", "PATCH")
// @ApiResponse(400, "L'entité Fourn ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Fourn spécifiée est introuvable")
// @ApiResponse(409, "L'entité Fourn spécifiée est un doublon")
var PatchFourn = (function () {
    function PatchFourn() {
    }
    PatchFourn.prototype.createResponse = function () { };
    PatchFourn.prototype.getTypeName = function () { return "PatchFourn"; };
    return PatchFourn;
}());
exports.PatchFourn = PatchFourn;
// @Route("/Fourn/Banque/{CleBanque}", "PATCH")
// @ApiResponse(400, "L'entité FournBanque ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournBanque spécifiée est introuvable")
// @ApiResponse(409, "L'entité FournBanque spécifiée est un doublon")
var PatchFournBanque = (function () {
    function PatchFournBanque() {
    }
    PatchFournBanque.prototype.createResponse = function () { };
    PatchFournBanque.prototype.getTypeName = function () { return "PatchFournBanque"; };
    return PatchFournBanque;
}());
exports.PatchFournBanque = PatchFournBanque;
// @Route("/Fourn/Contact/{CleContact}", "PATCH")
// @ApiResponse(400, "L'entité FournContact ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité FournContact spécifiée est introuvable")
// @ApiResponse(409, "L'entité FournContact spécifiée est un doublon")
var PatchFournContact = (function () {
    function PatchFournContact() {
    }
    PatchFournContact.prototype.createResponse = function () { };
    PatchFournContact.prototype.getTypeName = function () { return "PatchFournContact"; };
    return PatchFournContact;
}());
exports.PatchFournContact = PatchFournContact;
// @Route("/Fourn/Recherche/{Text}", "GET")
var SearchFourn = (function () {
    function SearchFourn() {
    }
    SearchFourn.prototype.createResponse = function () { return new SearchFournResponse(); };
    SearchFourn.prototype.getTypeName = function () { return "SearchFourn"; };
    return SearchFourn;
}());
exports.SearchFourn = SearchFourn;
// @Route("/Fourn", "GET")
// @ApiResponse(400, "L'entité Fourn ne contient pas tous les champs demandés")
var SelectFourn = (function () {
    function SelectFourn() {
    }
    SelectFourn.prototype.createResponse = function () { return new SelectFournResponse(); };
    SelectFourn.prototype.getTypeName = function () { return "SelectFourn"; };
    return SelectFourn;
}());
exports.SelectFourn = SelectFourn;
// @Route("/Fourn/{CleFourn}/Banque", "GET")
// @ApiResponse(400, "L'entité FournBanque ne contient pas tous les champs demandés")
var SelectFournBanque = (function () {
    function SelectFournBanque() {
    }
    SelectFournBanque.prototype.createResponse = function () { return new SelectFournBanqueResponse(); };
    SelectFournBanque.prototype.getTypeName = function () { return "SelectFournBanque"; };
    return SelectFournBanque;
}());
exports.SelectFournBanque = SelectFournBanque;
// @Route("/Fourn/{CleFourn}/Contact", "GET")
// @ApiResponse(400, "L'entité FournContact ne contient pas tous les champs demandés")
var SelectFournContact = (function () {
    function SelectFournContact() {
    }
    SelectFournContact.prototype.createResponse = function () { return new SelectFournContactResponse(); };
    SelectFournContact.prototype.getTypeName = function () { return "SelectFournContact"; };
    return SelectFournContact;
}());
exports.SelectFournContact = SelectFournContact;
// @Route("/Mandat/{CleMandat}", "DELETE")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
var DeleteMandat = (function () {
    function DeleteMandat() {
    }
    DeleteMandat.prototype.createResponse = function () { };
    DeleteMandat.prototype.getTypeName = function () { return "DeleteMandat"; };
    return DeleteMandat;
}());
exports.DeleteMandat = DeleteMandat;
// @Route("/Mandat/Mandataire/{CleMandataire}", "DELETE")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
var DeleteMandatMandataire = (function () {
    function DeleteMandatMandataire() {
    }
    DeleteMandatMandataire.prototype.createResponse = function () { };
    DeleteMandatMandataire.prototype.getTypeName = function () { return "DeleteMandatMandataire"; };
    return DeleteMandatMandataire;
}());
exports.DeleteMandatMandataire = DeleteMandatMandataire;
// @Route("/Mandat/{CleMandat}", "GET")
// @ApiResponse(400, "L'entité Mandat ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
var GetMandat = (function () {
    function GetMandat() {
    }
    GetMandat.prototype.createResponse = function () { return new Mandat(); };
    GetMandat.prototype.getTypeName = function () { return "GetMandat"; };
    return GetMandat;
}());
exports.GetMandat = GetMandat;
// @Route("/Mandat/Mandataire/{CleMandataire}", "GET")
// @ApiResponse(400, "L'entité MandatMandataire ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
var GetMandatMandataire = (function () {
    function GetMandatMandataire() {
    }
    GetMandatMandataire.prototype.createResponse = function () { return new MandatMandataire(); };
    GetMandatMandataire.prototype.getTypeName = function () { return "GetMandatMandataire"; };
    return GetMandatMandataire;
}());
exports.GetMandatMandataire = GetMandatMandataire;
// @Route("/Mandat/{CleMandat}", "PATCH")
// @ApiResponse(400, "L'entité Mandat ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Mandat spécifiée est introuvable")
// @ApiResponse(409, "L'entité Mandat spécifiée est un doublon")
var PatchMandat = (function () {
    function PatchMandat() {
    }
    PatchMandat.prototype.createResponse = function () { };
    PatchMandat.prototype.getTypeName = function () { return "PatchMandat"; };
    return PatchMandat;
}());
exports.PatchMandat = PatchMandat;
// @Route("/Mandat/Mandataire/{CleMandataire}", "PATCH")
// @ApiResponse(400, "L'entité MandatMandataire ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité MandatMandataire spécifiée est introuvable")
// @ApiResponse(409, "L'entité MandatMandataire spécifiée est un doublon")
var PatchMandatMandataire = (function () {
    function PatchMandatMandataire() {
    }
    PatchMandatMandataire.prototype.createResponse = function () { };
    PatchMandatMandataire.prototype.getTypeName = function () { return "PatchMandatMandataire"; };
    return PatchMandatMandataire;
}());
exports.PatchMandatMandataire = PatchMandatMandataire;
// @Route("/Mandat/Recherche/{Text}", "GET")
var SearchMandat = (function () {
    function SearchMandat() {
    }
    SearchMandat.prototype.createResponse = function () { return new SearchMandatResponse(); };
    SearchMandat.prototype.getTypeName = function () { return "SearchMandat"; };
    return SearchMandat;
}());
exports.SearchMandat = SearchMandat;
// @Route("/Mandat", "GET")
// @ApiResponse(400, "L'entité Mandat ne contient pas tous les champs demandés")
var SelectMandat = (function () {
    function SelectMandat() {
    }
    SelectMandat.prototype.createResponse = function () { return new SelectMandatResponse(); };
    SelectMandat.prototype.getTypeName = function () { return "SelectMandat"; };
    return SelectMandat;
}());
exports.SelectMandat = SelectMandat;
// @Route("/Mandat/{CleMandat}/Mandataire", "GET")
// @ApiResponse(400, "L'entité MandatMandataire ne contient pas tous les champs demandés")
var SelectMandatMandataire = (function () {
    function SelectMandatMandataire() {
    }
    SelectMandatMandataire.prototype.createResponse = function () { return new SelectMandatMandataireResponse(); };
    SelectMandatMandataire.prototype.getTypeName = function () { return "SelectMandatMandataire"; };
    return SelectMandatMandataire;
}());
exports.SelectMandatMandataire = SelectMandatMandataire;
// @Route("/Personne/{ClePersonne}", "DELETE")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
var DeletePersonne = (function () {
    function DeletePersonne() {
    }
    DeletePersonne.prototype.createResponse = function () { };
    DeletePersonne.prototype.getTypeName = function () { return "DeletePersonne"; };
    return DeletePersonne;
}());
exports.DeletePersonne = DeletePersonne;
// @Route("/Personne/Profil/{CleProfil}", "DELETE")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
var DeletePersonneProfil = (function () {
    function DeletePersonneProfil() {
    }
    DeletePersonneProfil.prototype.createResponse = function () { };
    DeletePersonneProfil.prototype.getTypeName = function () { return "DeletePersonneProfil"; };
    return DeletePersonneProfil;
}());
exports.DeletePersonneProfil = DeletePersonneProfil;
// @Route("/Personne/Signature/{ClePersonne}", "DELETE")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
var DeletePersonneSignature = (function () {
    function DeletePersonneSignature() {
    }
    DeletePersonneSignature.prototype.createResponse = function () { };
    DeletePersonneSignature.prototype.getTypeName = function () { return "DeletePersonneSignature"; };
    return DeletePersonneSignature;
}());
exports.DeletePersonneSignature = DeletePersonneSignature;
// @Route("/Personne/{ClePersonne}", "GET")
// @ApiResponse(400, "L'entité Personne ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
var GetPersonne = (function () {
    function GetPersonne() {
    }
    GetPersonne.prototype.createResponse = function () { return new Personne(); };
    GetPersonne.prototype.getTypeName = function () { return "GetPersonne"; };
    return GetPersonne;
}());
exports.GetPersonne = GetPersonne;
// @Route("/Personne/Profil/{CleProfil}", "GET")
// @ApiResponse(400, "L'entité PersonneProfil ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
var GetPersonneProfil = (function () {
    function GetPersonneProfil() {
    }
    GetPersonneProfil.prototype.createResponse = function () { return new PersonneProfil(); };
    GetPersonneProfil.prototype.getTypeName = function () { return "GetPersonneProfil"; };
    return GetPersonneProfil;
}());
exports.GetPersonneProfil = GetPersonneProfil;
// @Route("/Personne/Signature/{ClePersonne}", "GET")
// @ApiResponse(400, "L'entité PersonneSignature ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
var GetPersonneSignature = (function () {
    function GetPersonneSignature() {
    }
    GetPersonneSignature.prototype.createResponse = function () { return new PersonneSignature(); };
    GetPersonneSignature.prototype.getTypeName = function () { return "GetPersonneSignature"; };
    return GetPersonneSignature;
}());
exports.GetPersonneSignature = GetPersonneSignature;
// @Route("/Personne/{ClePersonne}", "PATCH")
// @ApiResponse(400, "L'entité Personne ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Personne spécifiée est introuvable")
// @ApiResponse(409, "L'entité Personne spécifiée est un doublon")
var PatchPersonne = (function () {
    function PatchPersonne() {
    }
    PatchPersonne.prototype.createResponse = function () { };
    PatchPersonne.prototype.getTypeName = function () { return "PatchPersonne"; };
    return PatchPersonne;
}());
exports.PatchPersonne = PatchPersonne;
// @Route("/Personne/Profil/{CleProfil}", "PATCH")
// @ApiResponse(400, "L'entité PersonneProfil ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneProfil spécifiée est introuvable")
// @ApiResponse(409, "L'entité PersonneProfil spécifiée est un doublon")
var PatchPersonneProfil = (function () {
    function PatchPersonneProfil() {
    }
    PatchPersonneProfil.prototype.createResponse = function () { };
    PatchPersonneProfil.prototype.getTypeName = function () { return "PatchPersonneProfil"; };
    return PatchPersonneProfil;
}());
exports.PatchPersonneProfil = PatchPersonneProfil;
// @Route("/Personne/Signature/{ClePersonne}", "PATCH")
// @ApiResponse(400, "L'entité PersonneSignature ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité PersonneSignature spécifiée est introuvable")
// @ApiResponse(409, "L'entité PersonneSignature spécifiée est un doublon")
var PatchPersonneSignature = (function () {
    function PatchPersonneSignature() {
    }
    PatchPersonneSignature.prototype.createResponse = function () { };
    PatchPersonneSignature.prototype.getTypeName = function () { return "PatchPersonneSignature"; };
    return PatchPersonneSignature;
}());
exports.PatchPersonneSignature = PatchPersonneSignature;
// @Route("/Personne", "GET")
// @ApiResponse(400, "L'entité Personne ne contient pas tous les champs demandés")
var SelectPersonne = (function () {
    function SelectPersonne() {
    }
    SelectPersonne.prototype.createResponse = function () { return new SelectPersonneResponse(); };
    SelectPersonne.prototype.getTypeName = function () { return "SelectPersonne"; };
    return SelectPersonne;
}());
exports.SelectPersonne = SelectPersonne;
// @Route("/Personne/{ClePersonne}/Profil", "GET")
// @ApiResponse(400, "L'entité PersonneProfil ne contient pas tous les champs demandés")
var SelectPersonneProfil = (function () {
    function SelectPersonneProfil() {
    }
    SelectPersonneProfil.prototype.createResponse = function () { return new SelectPersonneProfilResponse(); };
    SelectPersonneProfil.prototype.getTypeName = function () { return "SelectPersonneProfil"; };
    return SelectPersonneProfil;
}());
exports.SelectPersonneProfil = SelectPersonneProfil;
// @Route("/Personne/{ClePersonne}/Signature", "GET")
// @ApiResponse(400, "L'entité PersonneSignature ne contient pas tous les champs demandés")
var SelectPersonneSignature = (function () {
    function SelectPersonneSignature() {
    }
    SelectPersonneSignature.prototype.createResponse = function () { return new SelectPersonneSignatureResponse(); };
    SelectPersonneSignature.prototype.getTypeName = function () { return "SelectPersonneSignature"; };
    return SelectPersonneSignature;
}());
exports.SelectPersonneSignature = SelectPersonneSignature;
// @Route("/Service/{CleService}", "DELETE")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
var DeleteService = (function () {
    function DeleteService() {
    }
    DeleteService.prototype.createResponse = function () { };
    DeleteService.prototype.getTypeName = function () { return "DeleteService"; };
    return DeleteService;
}());
exports.DeleteService = DeleteService;
// @Route("/Service/{CleService}", "GET")
// @ApiResponse(400, "L'entité Service ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
var GetService = (function () {
    function GetService() {
    }
    GetService.prototype.createResponse = function () { return new Service(); };
    GetService.prototype.getTypeName = function () { return "GetService"; };
    return GetService;
}());
exports.GetService = GetService;
// @Route("/Service/{CleService}", "PATCH")
// @ApiResponse(400, "L'entité Service ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité Service spécifiée est introuvable")
// @ApiResponse(409, "L'entité Service spécifiée est un doublon")
var PatchService = (function () {
    function PatchService() {
    }
    PatchService.prototype.createResponse = function () { };
    PatchService.prototype.getTypeName = function () { return "PatchService"; };
    return PatchService;
}());
exports.PatchService = PatchService;
// @Route("/Service/Recherche/{Text}", "GET")
var SearchService = (function () {
    function SearchService() {
    }
    SearchService.prototype.createResponse = function () { return new SearchServiceResponse(); };
    SearchService.prototype.getTypeName = function () { return "SearchService"; };
    return SearchService;
}());
exports.SearchService = SearchService;
// @Route("/Service", "GET")
// @ApiResponse(400, "L'entité Service ne contient pas tous les champs demandés")
var SelectService = (function () {
    function SelectService() {
    }
    SelectService.prototype.createResponse = function () { return new SelectServiceResponse(); };
    SelectService.prototype.getTypeName = function () { return "SelectService"; };
    return SelectService;
}());
exports.SelectService = SelectService;
// @Route("/TVA/{CleTVA}", "DELETE")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
var DeleteTVA = (function () {
    function DeleteTVA() {
    }
    DeleteTVA.prototype.createResponse = function () { };
    DeleteTVA.prototype.getTypeName = function () { return "DeleteTVA"; };
    return DeleteTVA;
}());
exports.DeleteTVA = DeleteTVA;
// @Route("/TVA/{CleTVA}", "GET")
// @ApiResponse(400, "L'entité TVA ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
var GetTVA = (function () {
    function GetTVA() {
    }
    GetTVA.prototype.createResponse = function () { return new TVA(); };
    GetTVA.prototype.getTypeName = function () { return "GetTVA"; };
    return GetTVA;
}());
exports.GetTVA = GetTVA;
// @Route("/TVA/{CleTVA}", "PATCH")
// @ApiResponse(400, "L'entité TVA ne contient pas tous les champs demandés")
// @ApiResponse(404, "L'entité TVA spécifiée est introuvable")
// @ApiResponse(409, "L'entité TVA spécifiée est un doublon")
var PatchTVA = (function () {
    function PatchTVA() {
    }
    PatchTVA.prototype.createResponse = function () { };
    PatchTVA.prototype.getTypeName = function () { return "PatchTVA"; };
    return PatchTVA;
}());
exports.PatchTVA = PatchTVA;
// @Route("/TVA/Recherche/{Text}", "GET")
var SearchTVA = (function () {
    function SearchTVA() {
    }
    SearchTVA.prototype.createResponse = function () { return new SearchTVAResponse(); };
    SearchTVA.prototype.getTypeName = function () { return "SearchTVA"; };
    return SearchTVA;
}());
exports.SearchTVA = SearchTVA;
// @Route("/TVA", "GET")
// @ApiResponse(400, "L'entité TVA ne contient pas tous les champs demandés")
var SelectTVA = (function () {
    function SelectTVA() {
    }
    SelectTVA.prototype.createResponse = function () { return new SelectTVAResponse(); };
    SelectTVA.prototype.getTypeName = function () { return "SelectTVA"; };
    return SelectTVA;
}());
exports.SelectTVA = SelectTVA;
