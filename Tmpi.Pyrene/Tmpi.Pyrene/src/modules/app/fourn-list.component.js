System.register(["@angular/core", "./fourn.service"], function (exports_1, context_1) {
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
    var core_1, fourn_service_1, FournListComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (fourn_service_1_1) {
                fourn_service_1 = fourn_service_1_1;
            }
        ],
        execute: function () {
            FournListComponent = (function () {
                function FournListComponent(fournService) {
                    this.fournService = fournService;
                    this.fourn = {
                        sort: 'LibFourn',
                        pageIndex: 0,
                        pageSize: 20
                    };
                }
                FournListComponent.prototype.ngOnInit = function () {
                    this.loadFourn();
                };
                FournListComponent.prototype.loadFourn = function () {
                    var _this = this;
                    var fields = 'CodFourn,LibFourn,EstActif';
                    var skip = this.fourn.pageIndex * this.fourn.pageSize;
                    this.fournService.selectFourn(fields, [this.fourn.sort], skip, this.fourn.pageSize)
                        .then(function (r) { return _this.fourn.data = r.Results; });
                };
                FournListComponent.prototype.deleteFourn = function (id) {
                    this.fournService.deleteFourn(id);
                };
                return FournListComponent;
            }());
            FournListComponent = __decorate([
                core_1.Component({
                    selector: 'fourn-list',
                    templateUrl: 'fourn-list.component.html',
                    providers: [fourn_service_1.FournService]
                }),
                __metadata("design:paramtypes", [fourn_service_1.FournService])
            ], FournListComponent);
            exports_1("FournListComponent", FournListComponent);
        }
    };
});
//# sourceMappingURL=fourn-list.component.js.map