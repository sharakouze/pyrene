System.register(["@angular/core", "./tva.service"], function (exports_1, context_1) {
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
    var core_1, tva_service_1, TVAListComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (tva_service_1_1) {
                tva_service_1 = tva_service_1_1;
            }
        ],
        execute: function () {
            TVAListComponent = (function () {
                function TVAListComponent(tVAService) {
                    this.tVAService = tVAService;
                    this.tVA = {
                        sort: 'LibTVA',
                        pageIndex: 0,
                        pageSize: 20
                    };
                }
                TVAListComponent.prototype.ngOnInit = function () {
                    this.loadTVA();
                };
                TVAListComponent.prototype.loadTVA = function () {
                    var _this = this;
                    var fields = 'CodTVA,LibTVA,EstActif';
                    var skip = this.tVA.pageIndex * this.tVA.pageSize;
                    this.tVAService.selectTVA(fields, [this.tVA.sort], skip, this.tVA.pageSize)
                        .then(function (r) { return _this.tVA.data = r.Results; });
                };
                TVAListComponent.prototype.deleteTVA = function (id) {
                    this.tVAService.deleteTVA(id);
                };
                return TVAListComponent;
            }());
            TVAListComponent = __decorate([
                core_1.Component({
                    selector: 'tva-list',
                    templateUrl: 'tva-list.component.html',
                    providers: [tva_service_1.TVAService]
                }),
                __metadata("design:paramtypes", [tva_service_1.TVAService])
            ], TVAListComponent);
            exports_1("TVAListComponent", TVAListComponent);
        }
    };
});
//# sourceMappingURL=tva-list.component.js.map