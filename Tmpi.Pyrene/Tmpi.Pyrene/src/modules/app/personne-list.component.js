System.register(["@angular/core", "./personne.service"], function (exports_1, context_1) {
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
    var core_1, personne_service_1, PersonneListComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (personne_service_1_1) {
                personne_service_1 = personne_service_1_1;
            }
        ],
        execute: function () {
            PersonneListComponent = (function () {
                function PersonneListComponent(personneService) {
                    this.personneService = personneService;
                    this.personne = {
                        sort: 'CodPersonne',
                        pageIndex: 0,
                        pageSize: 20
                    };
                }
                PersonneListComponent.prototype.ngOnInit = function () {
                    this.loadPersonne();
                };
                PersonneListComponent.prototype.loadPersonne = function () {
                    var _this = this;
                    var fields = 'CodPersonne,NomPersonne,EstActif';
                    var skip = this.personne.pageIndex * this.personne.pageSize;
                    this.personneService.selectPersonne(fields, [this.personne.sort], skip, this.personne.pageSize)
                        .then(function (r) { return _this.personne.data = r.Results; });
                };
                PersonneListComponent.prototype.deletePersonne = function (id) {
                    this.personneService.deletePersonne(id);
                };
                return PersonneListComponent;
            }());
            PersonneListComponent = __decorate([
                core_1.Component({
                    selector: 'personne-list',
                    templateUrl: 'personne-list.component.html',
                    providers: [personne_service_1.PersonneService]
                }),
                __metadata("design:paramtypes", [personne_service_1.PersonneService])
            ], PersonneListComponent);
            exports_1("PersonneListComponent", PersonneListComponent);
        }
    };
});
//# sourceMappingURL=personne-list.component.js.map