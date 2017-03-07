System.register(["@angular/core", "./mandat.service"], function (exports_1, context_1) {
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
    var core_1, mandat_service_1, MandatListComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (mandat_service_1_1) {
                mandat_service_1 = mandat_service_1_1;
            }
        ],
        execute: function () {
            MandatListComponent = (function () {
                function MandatListComponent(mandatService) {
                    this.mandatService = mandatService;
                    this.mandat = {
                        sort: 'LibMandat',
                        pageIndex: 0,
                        pageSize: 20
                    };
                }
                MandatListComponent.prototype.ngOnInit = function () {
                    this.loadMandat();
                };
                MandatListComponent.prototype.loadMandat = function () {
                    var _this = this;
                    var fields = 'CodMandat,LibMandat,EstActif';
                    var skip = this.mandat.pageIndex * this.mandat.pageSize;
                    this.mandatService.selectMandat(fields, [this.mandat.sort], skip, this.mandat.pageSize)
                        .then(function (r) { return _this.mandat.data = r.Results; });
                };
                MandatListComponent.prototype.deleteMandat = function (id) {
                    this.mandatService.deleteMandat(id);
                };
                return MandatListComponent;
            }());
            MandatListComponent = __decorate([
                core_1.Component({
                    selector: 'mandat-list',
                    templateUrl: 'mandat-list.component.html',
                    providers: [mandat_service_1.MandatService]
                }),
                __metadata("design:paramtypes", [mandat_service_1.MandatService])
            ], MandatListComponent);
            exports_1("MandatListComponent", MandatListComponent);
        }
    };
});
//# sourceMappingURL=mandat-list.component.js.map