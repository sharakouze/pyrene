System.register([], function (exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var Patch, ResponseError, ResponseStatus, BaseEntity, Service, Compteur, CompteurValeur, SearchCompteurResponse, SelectCompteurResponse, SelectCompteurValeurResponse, Exercice, SearchExerciceResponse, SelectExerciceResponse, Fourn, FournBanque, FournContact, SearchFournResponse, SelectFournResponse, SelectFournBanqueResponse, SelectFournContactResponse, Mandat, Personne, MandatMandataire, SearchMandatResponse, SelectMandatResponse, SelectMandatMandataireResponse, PersonneProfil, PersonneSignature, SelectPersonneResponse, SelectPersonneProfilResponse, SelectPersonneSignatureResponse, SearchServiceResponse, SelectServiceResponse, TVA, SearchTVAResponse, SelectTVAResponse, DeleteCompteur, DeleteCompteurValeur, GetCompteur, GetCompteurValeur, PatchCompteur, PatchCompteurValeur, SearchCompteur, SelectCompteur, SelectCompteurValeur, DeleteExercice, GetExercice, PatchExercice, SearchExercice, SelectExercice, DeleteFourn, DeleteFournBanque, DeleteFournContact, GetFourn, GetFournBanque, GetFournContact, PatchFourn, PatchFournBanque, PatchFournContact, SearchFourn, SelectFourn, SelectFournBanque, SelectFournContact, DeleteMandat, DeleteMandatMandataire, GetMandat, GetMandatMandataire, PatchMandat, PatchMandatMandataire, SearchMandat, SelectMandat, SelectMandatMandataire, DeletePersonne, DeletePersonneProfil, DeletePersonneSignature, GetPersonne, GetPersonneProfil, GetPersonneSignature, PatchPersonne, PatchPersonneProfil, PatchPersonneSignature, SelectPersonne, SelectPersonneProfil, SelectPersonneSignature, DeleteService, GetService, PatchService, SearchService, SelectService, DeleteTVA, GetTVA, PatchTVA, SearchTVA, SelectTVA;
    return {
        setters: [],
        execute: function () {
            Patch = (function () {
                function Patch() {
                }
                return Patch;
            }());
            exports_1("Patch", Patch);
            ResponseError = (function () {
                function ResponseError() {
                }
                return ResponseError;
            }());
            exports_1("ResponseError", ResponseError);
            ResponseStatus = (function () {
                function ResponseStatus() {
                }
                return ResponseStatus;
            }());
            exports_1("ResponseStatus", ResponseStatus);
            BaseEntity = (function () {
                function BaseEntity() {
                }
                return BaseEntity;
            }());
            exports_1("BaseEntity", BaseEntity);
            Service = (function () {
                function Service() {
                }
                return Service;
            }());
            exports_1("Service", Service);
            Compteur = (function () {
                function Compteur() {
                }
                Compteur.prototype.createResponse = function () { return new Compteur(); };
                Compteur.prototype.getTypeName = function () { return "Compteur"; };
                return Compteur;
            }());
            exports_1("Compteur", Compteur);
            CompteurValeur = (function () {
                function CompteurValeur() {
                }
                CompteurValeur.prototype.createResponse = function () { return new CompteurValeur(); };
                CompteurValeur.prototype.getTypeName = function () { return "CompteurValeur"; };
                return CompteurValeur;
            }());
            exports_1("CompteurValeur", CompteurValeur);
            SearchCompteurResponse = (function () {
                function SearchCompteurResponse() {
                }
                return SearchCompteurResponse;
            }());
            exports_1("SearchCompteurResponse", SearchCompteurResponse);
            SelectCompteurResponse = (function () {
                function SelectCompteurResponse() {
                }
                return SelectCompteurResponse;
            }());
            exports_1("SelectCompteurResponse", SelectCompteurResponse);
            SelectCompteurValeurResponse = (function () {
                function SelectCompteurValeurResponse() {
                }
                return SelectCompteurValeurResponse;
            }());
            exports_1("SelectCompteurValeurResponse", SelectCompteurValeurResponse);
            Exercice = (function () {
                function Exercice() {
                }
                Exercice.prototype.createResponse = function () { return new Exercice(); };
                Exercice.prototype.getTypeName = function () { return "Exercice"; };
                return Exercice;
            }());
            exports_1("Exercice", Exercice);
            SearchExerciceResponse = (function () {
                function SearchExerciceResponse() {
                }
                return SearchExerciceResponse;
            }());
            exports_1("SearchExerciceResponse", SearchExerciceResponse);
            SelectExerciceResponse = (function () {
                function SelectExerciceResponse() {
                }
                return SelectExerciceResponse;
            }());
            exports_1("SelectExerciceResponse", SelectExerciceResponse);
            Fourn = (function () {
                function Fourn() {
                }
                Fourn.prototype.createResponse = function () { return new Fourn(); };
                Fourn.prototype.getTypeName = function () { return "Fourn"; };
                return Fourn;
            }());
            exports_1("Fourn", Fourn);
            FournBanque = (function () {
                function FournBanque() {
                }
                FournBanque.prototype.createResponse = function () { return new FournBanque(); };
                FournBanque.prototype.getTypeName = function () { return "FournBanque"; };
                return FournBanque;
            }());
            exports_1("FournBanque", FournBanque);
            FournContact = (function () {
                function FournContact() {
                }
                FournContact.prototype.createResponse = function () { return new FournContact(); };
                FournContact.prototype.getTypeName = function () { return "FournContact"; };
                return FournContact;
            }());
            exports_1("FournContact", FournContact);
            SearchFournResponse = (function () {
                function SearchFournResponse() {
                }
                return SearchFournResponse;
            }());
            exports_1("SearchFournResponse", SearchFournResponse);
            SelectFournResponse = (function () {
                function SelectFournResponse() {
                }
                return SelectFournResponse;
            }());
            exports_1("SelectFournResponse", SelectFournResponse);
            SelectFournBanqueResponse = (function () {
                function SelectFournBanqueResponse() {
                }
                return SelectFournBanqueResponse;
            }());
            exports_1("SelectFournBanqueResponse", SelectFournBanqueResponse);
            SelectFournContactResponse = (function () {
                function SelectFournContactResponse() {
                }
                return SelectFournContactResponse;
            }());
            exports_1("SelectFournContactResponse", SelectFournContactResponse);
            Mandat = (function () {
                function Mandat() {
                }
                return Mandat;
            }());
            exports_1("Mandat", Mandat);
            Personne = (function () {
                function Personne() {
                }
                return Personne;
            }());
            exports_1("Personne", Personne);
            MandatMandataire = (function () {
                function MandatMandataire() {
                }
                return MandatMandataire;
            }());
            exports_1("MandatMandataire", MandatMandataire);
            SearchMandatResponse = (function () {
                function SearchMandatResponse() {
                }
                return SearchMandatResponse;
            }());
            exports_1("SearchMandatResponse", SearchMandatResponse);
            SelectMandatResponse = (function () {
                function SelectMandatResponse() {
                }
                return SelectMandatResponse;
            }());
            exports_1("SelectMandatResponse", SelectMandatResponse);
            SelectMandatMandataireResponse = (function () {
                function SelectMandatMandataireResponse() {
                }
                return SelectMandatMandataireResponse;
            }());
            exports_1("SelectMandatMandataireResponse", SelectMandatMandataireResponse);
            PersonneProfil = (function () {
                function PersonneProfil() {
                }
                return PersonneProfil;
            }());
            exports_1("PersonneProfil", PersonneProfil);
            PersonneSignature = (function () {
                function PersonneSignature() {
                }
                return PersonneSignature;
            }());
            exports_1("PersonneSignature", PersonneSignature);
            SelectPersonneResponse = (function () {
                function SelectPersonneResponse() {
                }
                return SelectPersonneResponse;
            }());
            exports_1("SelectPersonneResponse", SelectPersonneResponse);
            SelectPersonneProfilResponse = (function () {
                function SelectPersonneProfilResponse() {
                }
                return SelectPersonneProfilResponse;
            }());
            exports_1("SelectPersonneProfilResponse", SelectPersonneProfilResponse);
            SelectPersonneSignatureResponse = (function () {
                function SelectPersonneSignatureResponse() {
                }
                return SelectPersonneSignatureResponse;
            }());
            exports_1("SelectPersonneSignatureResponse", SelectPersonneSignatureResponse);
            SearchServiceResponse = (function () {
                function SearchServiceResponse() {
                }
                return SearchServiceResponse;
            }());
            exports_1("SearchServiceResponse", SearchServiceResponse);
            SelectServiceResponse = (function () {
                function SelectServiceResponse() {
                }
                return SelectServiceResponse;
            }());
            exports_1("SelectServiceResponse", SelectServiceResponse);
            TVA = (function () {
                function TVA() {
                }
                return TVA;
            }());
            exports_1("TVA", TVA);
            SearchTVAResponse = (function () {
                function SearchTVAResponse() {
                }
                return SearchTVAResponse;
            }());
            exports_1("SearchTVAResponse", SearchTVAResponse);
            SelectTVAResponse = (function () {
                function SelectTVAResponse() {
                }
                return SelectTVAResponse;
            }());
            exports_1("SelectTVAResponse", SelectTVAResponse);
            DeleteCompteur = (function () {
                function DeleteCompteur() {
                }
                DeleteCompteur.prototype.createResponse = function () { };
                DeleteCompteur.prototype.getTypeName = function () { return "DeleteCompteur"; };
                return DeleteCompteur;
            }());
            exports_1("DeleteCompteur", DeleteCompteur);
            DeleteCompteurValeur = (function () {
                function DeleteCompteurValeur() {
                }
                DeleteCompteurValeur.prototype.createResponse = function () { };
                DeleteCompteurValeur.prototype.getTypeName = function () { return "DeleteCompteurValeur"; };
                return DeleteCompteurValeur;
            }());
            exports_1("DeleteCompteurValeur", DeleteCompteurValeur);
            GetCompteur = (function () {
                function GetCompteur() {
                }
                GetCompteur.prototype.createResponse = function () { return new Compteur(); };
                GetCompteur.prototype.getTypeName = function () { return "GetCompteur"; };
                return GetCompteur;
            }());
            exports_1("GetCompteur", GetCompteur);
            GetCompteurValeur = (function () {
                function GetCompteurValeur() {
                }
                GetCompteurValeur.prototype.createResponse = function () { return new CompteurValeur(); };
                GetCompteurValeur.prototype.getTypeName = function () { return "GetCompteurValeur"; };
                return GetCompteurValeur;
            }());
            exports_1("GetCompteurValeur", GetCompteurValeur);
            PatchCompteur = (function () {
                function PatchCompteur() {
                }
                PatchCompteur.prototype.createResponse = function () { };
                PatchCompteur.prototype.getTypeName = function () { return "PatchCompteur"; };
                return PatchCompteur;
            }());
            exports_1("PatchCompteur", PatchCompteur);
            PatchCompteurValeur = (function () {
                function PatchCompteurValeur() {
                }
                PatchCompteurValeur.prototype.createResponse = function () { };
                PatchCompteurValeur.prototype.getTypeName = function () { return "PatchCompteurValeur"; };
                return PatchCompteurValeur;
            }());
            exports_1("PatchCompteurValeur", PatchCompteurValeur);
            SearchCompteur = (function () {
                function SearchCompteur() {
                }
                SearchCompteur.prototype.createResponse = function () { return new SearchCompteurResponse(); };
                SearchCompteur.prototype.getTypeName = function () { return "SearchCompteur"; };
                return SearchCompteur;
            }());
            exports_1("SearchCompteur", SearchCompteur);
            SelectCompteur = (function () {
                function SelectCompteur() {
                }
                SelectCompteur.prototype.createResponse = function () { return new SelectCompteurResponse(); };
                SelectCompteur.prototype.getTypeName = function () { return "SelectCompteur"; };
                return SelectCompteur;
            }());
            exports_1("SelectCompteur", SelectCompteur);
            SelectCompteurValeur = (function () {
                function SelectCompteurValeur() {
                }
                SelectCompteurValeur.prototype.createResponse = function () { return new SelectCompteurValeurResponse(); };
                SelectCompteurValeur.prototype.getTypeName = function () { return "SelectCompteurValeur"; };
                return SelectCompteurValeur;
            }());
            exports_1("SelectCompteurValeur", SelectCompteurValeur);
            DeleteExercice = (function () {
                function DeleteExercice() {
                }
                DeleteExercice.prototype.createResponse = function () { };
                DeleteExercice.prototype.getTypeName = function () { return "DeleteExercice"; };
                return DeleteExercice;
            }());
            exports_1("DeleteExercice", DeleteExercice);
            GetExercice = (function () {
                function GetExercice() {
                }
                GetExercice.prototype.createResponse = function () { return new Exercice(); };
                GetExercice.prototype.getTypeName = function () { return "GetExercice"; };
                return GetExercice;
            }());
            exports_1("GetExercice", GetExercice);
            PatchExercice = (function () {
                function PatchExercice() {
                }
                PatchExercice.prototype.createResponse = function () { };
                PatchExercice.prototype.getTypeName = function () { return "PatchExercice"; };
                return PatchExercice;
            }());
            exports_1("PatchExercice", PatchExercice);
            SearchExercice = (function () {
                function SearchExercice() {
                }
                SearchExercice.prototype.createResponse = function () { return new SearchExerciceResponse(); };
                SearchExercice.prototype.getTypeName = function () { return "SearchExercice"; };
                return SearchExercice;
            }());
            exports_1("SearchExercice", SearchExercice);
            SelectExercice = (function () {
                function SelectExercice() {
                }
                SelectExercice.prototype.createResponse = function () { return new SelectExerciceResponse(); };
                SelectExercice.prototype.getTypeName = function () { return "SelectExercice"; };
                return SelectExercice;
            }());
            exports_1("SelectExercice", SelectExercice);
            DeleteFourn = (function () {
                function DeleteFourn() {
                }
                DeleteFourn.prototype.createResponse = function () { };
                DeleteFourn.prototype.getTypeName = function () { return "DeleteFourn"; };
                return DeleteFourn;
            }());
            exports_1("DeleteFourn", DeleteFourn);
            DeleteFournBanque = (function () {
                function DeleteFournBanque() {
                }
                DeleteFournBanque.prototype.createResponse = function () { };
                DeleteFournBanque.prototype.getTypeName = function () { return "DeleteFournBanque"; };
                return DeleteFournBanque;
            }());
            exports_1("DeleteFournBanque", DeleteFournBanque);
            DeleteFournContact = (function () {
                function DeleteFournContact() {
                }
                DeleteFournContact.prototype.createResponse = function () { };
                DeleteFournContact.prototype.getTypeName = function () { return "DeleteFournContact"; };
                return DeleteFournContact;
            }());
            exports_1("DeleteFournContact", DeleteFournContact);
            GetFourn = (function () {
                function GetFourn() {
                }
                GetFourn.prototype.createResponse = function () { return new Fourn(); };
                GetFourn.prototype.getTypeName = function () { return "GetFourn"; };
                return GetFourn;
            }());
            exports_1("GetFourn", GetFourn);
            GetFournBanque = (function () {
                function GetFournBanque() {
                }
                GetFournBanque.prototype.createResponse = function () { return new FournBanque(); };
                GetFournBanque.prototype.getTypeName = function () { return "GetFournBanque"; };
                return GetFournBanque;
            }());
            exports_1("GetFournBanque", GetFournBanque);
            GetFournContact = (function () {
                function GetFournContact() {
                }
                GetFournContact.prototype.createResponse = function () { return new FournContact(); };
                GetFournContact.prototype.getTypeName = function () { return "GetFournContact"; };
                return GetFournContact;
            }());
            exports_1("GetFournContact", GetFournContact);
            PatchFourn = (function () {
                function PatchFourn() {
                }
                PatchFourn.prototype.createResponse = function () { };
                PatchFourn.prototype.getTypeName = function () { return "PatchFourn"; };
                return PatchFourn;
            }());
            exports_1("PatchFourn", PatchFourn);
            PatchFournBanque = (function () {
                function PatchFournBanque() {
                }
                PatchFournBanque.prototype.createResponse = function () { };
                PatchFournBanque.prototype.getTypeName = function () { return "PatchFournBanque"; };
                return PatchFournBanque;
            }());
            exports_1("PatchFournBanque", PatchFournBanque);
            PatchFournContact = (function () {
                function PatchFournContact() {
                }
                PatchFournContact.prototype.createResponse = function () { };
                PatchFournContact.prototype.getTypeName = function () { return "PatchFournContact"; };
                return PatchFournContact;
            }());
            exports_1("PatchFournContact", PatchFournContact);
            SearchFourn = (function () {
                function SearchFourn() {
                }
                SearchFourn.prototype.createResponse = function () { return new SearchFournResponse(); };
                SearchFourn.prototype.getTypeName = function () { return "SearchFourn"; };
                return SearchFourn;
            }());
            exports_1("SearchFourn", SearchFourn);
            SelectFourn = (function () {
                function SelectFourn() {
                }
                SelectFourn.prototype.createResponse = function () { return new SelectFournResponse(); };
                SelectFourn.prototype.getTypeName = function () { return "SelectFourn"; };
                return SelectFourn;
            }());
            exports_1("SelectFourn", SelectFourn);
            SelectFournBanque = (function () {
                function SelectFournBanque() {
                }
                SelectFournBanque.prototype.createResponse = function () { return new SelectFournBanqueResponse(); };
                SelectFournBanque.prototype.getTypeName = function () { return "SelectFournBanque"; };
                return SelectFournBanque;
            }());
            exports_1("SelectFournBanque", SelectFournBanque);
            SelectFournContact = (function () {
                function SelectFournContact() {
                }
                SelectFournContact.prototype.createResponse = function () { return new SelectFournContactResponse(); };
                SelectFournContact.prototype.getTypeName = function () { return "SelectFournContact"; };
                return SelectFournContact;
            }());
            exports_1("SelectFournContact", SelectFournContact);
            DeleteMandat = (function () {
                function DeleteMandat() {
                }
                DeleteMandat.prototype.createResponse = function () { };
                DeleteMandat.prototype.getTypeName = function () { return "DeleteMandat"; };
                return DeleteMandat;
            }());
            exports_1("DeleteMandat", DeleteMandat);
            DeleteMandatMandataire = (function () {
                function DeleteMandatMandataire() {
                }
                DeleteMandatMandataire.prototype.createResponse = function () { };
                DeleteMandatMandataire.prototype.getTypeName = function () { return "DeleteMandatMandataire"; };
                return DeleteMandatMandataire;
            }());
            exports_1("DeleteMandatMandataire", DeleteMandatMandataire);
            GetMandat = (function () {
                function GetMandat() {
                }
                GetMandat.prototype.createResponse = function () { return new Mandat(); };
                GetMandat.prototype.getTypeName = function () { return "GetMandat"; };
                return GetMandat;
            }());
            exports_1("GetMandat", GetMandat);
            GetMandatMandataire = (function () {
                function GetMandatMandataire() {
                }
                GetMandatMandataire.prototype.createResponse = function () { return new MandatMandataire(); };
                GetMandatMandataire.prototype.getTypeName = function () { return "GetMandatMandataire"; };
                return GetMandatMandataire;
            }());
            exports_1("GetMandatMandataire", GetMandatMandataire);
            PatchMandat = (function () {
                function PatchMandat() {
                }
                PatchMandat.prototype.createResponse = function () { };
                PatchMandat.prototype.getTypeName = function () { return "PatchMandat"; };
                return PatchMandat;
            }());
            exports_1("PatchMandat", PatchMandat);
            PatchMandatMandataire = (function () {
                function PatchMandatMandataire() {
                }
                PatchMandatMandataire.prototype.createResponse = function () { };
                PatchMandatMandataire.prototype.getTypeName = function () { return "PatchMandatMandataire"; };
                return PatchMandatMandataire;
            }());
            exports_1("PatchMandatMandataire", PatchMandatMandataire);
            SearchMandat = (function () {
                function SearchMandat() {
                }
                SearchMandat.prototype.createResponse = function () { return new SearchMandatResponse(); };
                SearchMandat.prototype.getTypeName = function () { return "SearchMandat"; };
                return SearchMandat;
            }());
            exports_1("SearchMandat", SearchMandat);
            SelectMandat = (function () {
                function SelectMandat() {
                }
                SelectMandat.prototype.createResponse = function () { return new SelectMandatResponse(); };
                SelectMandat.prototype.getTypeName = function () { return "SelectMandat"; };
                return SelectMandat;
            }());
            exports_1("SelectMandat", SelectMandat);
            SelectMandatMandataire = (function () {
                function SelectMandatMandataire() {
                }
                SelectMandatMandataire.prototype.createResponse = function () { return new SelectMandatMandataireResponse(); };
                SelectMandatMandataire.prototype.getTypeName = function () { return "SelectMandatMandataire"; };
                return SelectMandatMandataire;
            }());
            exports_1("SelectMandatMandataire", SelectMandatMandataire);
            DeletePersonne = (function () {
                function DeletePersonne() {
                }
                DeletePersonne.prototype.createResponse = function () { };
                DeletePersonne.prototype.getTypeName = function () { return "DeletePersonne"; };
                return DeletePersonne;
            }());
            exports_1("DeletePersonne", DeletePersonne);
            DeletePersonneProfil = (function () {
                function DeletePersonneProfil() {
                }
                DeletePersonneProfil.prototype.createResponse = function () { };
                DeletePersonneProfil.prototype.getTypeName = function () { return "DeletePersonneProfil"; };
                return DeletePersonneProfil;
            }());
            exports_1("DeletePersonneProfil", DeletePersonneProfil);
            DeletePersonneSignature = (function () {
                function DeletePersonneSignature() {
                }
                DeletePersonneSignature.prototype.createResponse = function () { };
                DeletePersonneSignature.prototype.getTypeName = function () { return "DeletePersonneSignature"; };
                return DeletePersonneSignature;
            }());
            exports_1("DeletePersonneSignature", DeletePersonneSignature);
            GetPersonne = (function () {
                function GetPersonne() {
                }
                GetPersonne.prototype.createResponse = function () { return new Personne(); };
                GetPersonne.prototype.getTypeName = function () { return "GetPersonne"; };
                return GetPersonne;
            }());
            exports_1("GetPersonne", GetPersonne);
            GetPersonneProfil = (function () {
                function GetPersonneProfil() {
                }
                GetPersonneProfil.prototype.createResponse = function () { return new PersonneProfil(); };
                GetPersonneProfil.prototype.getTypeName = function () { return "GetPersonneProfil"; };
                return GetPersonneProfil;
            }());
            exports_1("GetPersonneProfil", GetPersonneProfil);
            GetPersonneSignature = (function () {
                function GetPersonneSignature() {
                }
                GetPersonneSignature.prototype.createResponse = function () { return new PersonneSignature(); };
                GetPersonneSignature.prototype.getTypeName = function () { return "GetPersonneSignature"; };
                return GetPersonneSignature;
            }());
            exports_1("GetPersonneSignature", GetPersonneSignature);
            PatchPersonne = (function () {
                function PatchPersonne() {
                }
                PatchPersonne.prototype.createResponse = function () { };
                PatchPersonne.prototype.getTypeName = function () { return "PatchPersonne"; };
                return PatchPersonne;
            }());
            exports_1("PatchPersonne", PatchPersonne);
            PatchPersonneProfil = (function () {
                function PatchPersonneProfil() {
                }
                PatchPersonneProfil.prototype.createResponse = function () { };
                PatchPersonneProfil.prototype.getTypeName = function () { return "PatchPersonneProfil"; };
                return PatchPersonneProfil;
            }());
            exports_1("PatchPersonneProfil", PatchPersonneProfil);
            PatchPersonneSignature = (function () {
                function PatchPersonneSignature() {
                }
                PatchPersonneSignature.prototype.createResponse = function () { };
                PatchPersonneSignature.prototype.getTypeName = function () { return "PatchPersonneSignature"; };
                return PatchPersonneSignature;
            }());
            exports_1("PatchPersonneSignature", PatchPersonneSignature);
            SelectPersonne = (function () {
                function SelectPersonne() {
                }
                SelectPersonne.prototype.createResponse = function () { return new SelectPersonneResponse(); };
                SelectPersonne.prototype.getTypeName = function () { return "SelectPersonne"; };
                return SelectPersonne;
            }());
            exports_1("SelectPersonne", SelectPersonne);
            SelectPersonneProfil = (function () {
                function SelectPersonneProfil() {
                }
                SelectPersonneProfil.prototype.createResponse = function () { return new SelectPersonneProfilResponse(); };
                SelectPersonneProfil.prototype.getTypeName = function () { return "SelectPersonneProfil"; };
                return SelectPersonneProfil;
            }());
            exports_1("SelectPersonneProfil", SelectPersonneProfil);
            SelectPersonneSignature = (function () {
                function SelectPersonneSignature() {
                }
                SelectPersonneSignature.prototype.createResponse = function () { return new SelectPersonneSignatureResponse(); };
                SelectPersonneSignature.prototype.getTypeName = function () { return "SelectPersonneSignature"; };
                return SelectPersonneSignature;
            }());
            exports_1("SelectPersonneSignature", SelectPersonneSignature);
            DeleteService = (function () {
                function DeleteService() {
                }
                DeleteService.prototype.createResponse = function () { };
                DeleteService.prototype.getTypeName = function () { return "DeleteService"; };
                return DeleteService;
            }());
            exports_1("DeleteService", DeleteService);
            GetService = (function () {
                function GetService() {
                }
                GetService.prototype.createResponse = function () { return new Service(); };
                GetService.prototype.getTypeName = function () { return "GetService"; };
                return GetService;
            }());
            exports_1("GetService", GetService);
            PatchService = (function () {
                function PatchService() {
                }
                PatchService.prototype.createResponse = function () { };
                PatchService.prototype.getTypeName = function () { return "PatchService"; };
                return PatchService;
            }());
            exports_1("PatchService", PatchService);
            SearchService = (function () {
                function SearchService() {
                }
                SearchService.prototype.createResponse = function () { return new SearchServiceResponse(); };
                SearchService.prototype.getTypeName = function () { return "SearchService"; };
                return SearchService;
            }());
            exports_1("SearchService", SearchService);
            SelectService = (function () {
                function SelectService() {
                }
                SelectService.prototype.createResponse = function () { return new SelectServiceResponse(); };
                SelectService.prototype.getTypeName = function () { return "SelectService"; };
                return SelectService;
            }());
            exports_1("SelectService", SelectService);
            DeleteTVA = (function () {
                function DeleteTVA() {
                }
                DeleteTVA.prototype.createResponse = function () { };
                DeleteTVA.prototype.getTypeName = function () { return "DeleteTVA"; };
                return DeleteTVA;
            }());
            exports_1("DeleteTVA", DeleteTVA);
            GetTVA = (function () {
                function GetTVA() {
                }
                GetTVA.prototype.createResponse = function () { return new TVA(); };
                GetTVA.prototype.getTypeName = function () { return "GetTVA"; };
                return GetTVA;
            }());
            exports_1("GetTVA", GetTVA);
            PatchTVA = (function () {
                function PatchTVA() {
                }
                PatchTVA.prototype.createResponse = function () { };
                PatchTVA.prototype.getTypeName = function () { return "PatchTVA"; };
                return PatchTVA;
            }());
            exports_1("PatchTVA", PatchTVA);
            SearchTVA = (function () {
                function SearchTVA() {
                }
                SearchTVA.prototype.createResponse = function () { return new SearchTVAResponse(); };
                SearchTVA.prototype.getTypeName = function () { return "SearchTVA"; };
                return SearchTVA;
            }());
            exports_1("SearchTVA", SearchTVA);
            SelectTVA = (function () {
                function SelectTVA() {
                }
                SelectTVA.prototype.createResponse = function () { return new SelectTVAResponse(); };
                SelectTVA.prototype.getTypeName = function () { return "SelectTVA"; };
                return SelectTVA;
            }());
            exports_1("SelectTVA", SelectTVA);
        }
    };
});
//# sourceMappingURL=dtos.js.map