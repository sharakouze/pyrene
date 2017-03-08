System.register(["@angular/core", "./compteur.service"], function (exports_1, context_1) {
    "use strict";
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __metadata = (this && this.__metadata) || function (k, v) {
        if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, compteur_service_1, CompteurListComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (compteur_service_1_1) {
                compteur_service_1 = compteur_service_1_1;
            }
        ],
        execute: function () {
            CompteurListComponent = (function () {
                function CompteurListComponent(compteurService) {
                    this.compteurService = compteurService;
                    this.compteur = {
                        sort: 'LibCompteur',
                        pageIndex: 0,
                        pageSize: 20
                    };
                }
                CompteurListComponent.prototype.ngOnInit = function () {
                    this.loadCompteur();
                };
                CompteurListComponent.prototype.loadCompteur = function () {
                    var _this = this;
                    var fields = 'CodCompteur,LibCompteur,EstActif,TypCompteur,Service(CodService)';
                    var skip = this.compteur.pageIndex * this.compteur.pageSize;
                    this.compteurService.selectCompteur(fields, [this.compteur.sort], skip, this.compteur.pageSize)
                        .then(function (r) { return _this.compteur.data = r.Results; });
                };
                CompteurListComponent.prototype.deleteCompteur = function (id) {
                    this.compteurService.deleteCompteur(id);
                };
                return CompteurListComponent;
            }());
            CompteurListComponent = __decorate([
                core_1.Component({
                    selector: 'compteur-list',
                    template: require('./compteur-list.cdomponent.html'),
                    providers: [compteur_service_1.CompteurService]
                }),
                __metadata("design:paramtypes", [compteur_service_1.CompteurService])
            ], CompteurListComponent);
            exports_1("CompteurListComponent", CompteurListComponent);
        }
    };
});
//# sourceMappingURL=compteur-list.component.js.map