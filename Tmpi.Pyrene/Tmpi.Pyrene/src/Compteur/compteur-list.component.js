"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var core_1 = require("@angular/core");
var compteur_service_1 = require("./compteur.service");
var CompteurListComponent = (function () {
    function CompteurListComponent(compteurService) {
        this.compteurService = compteurService;
    }
    CompteurListComponent.prototype.ngOnInit = function () {
        this.load();
    };
    CompteurListComponent.prototype.load = function () {
        this.compteurService.selectCompteur('', '', null, 0);
    };
    return CompteurListComponent;
}());
CompteurListComponent = __decorate([
    core_1.Component({
        selector: 'compteur-list',
        templateUrl: 'compteur-list.component.html',
        providers: [compteur_service_1.CompteurService]
    })
], CompteurListComponent);
exports.CompteurListComponent = CompteurListComponent;
