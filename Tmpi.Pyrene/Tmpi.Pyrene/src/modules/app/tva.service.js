System.register(["@angular/core", "../../service-client", "../../dtos"], function (exports_1, context_1) {
    "use strict";
    var __extends = (this && this.__extends) || function (d, b) {
        for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, service_client_1, dtos_1, TVAService;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (service_client_1_1) {
                service_client_1 = service_client_1_1;
            },
            function (dtos_1_1) {
                dtos_1 = dtos_1_1;
            }
        ],
        execute: function () {
            TVAService = (function (_super) {
                __extends(TVAService, _super);
                function TVAService() {
                    return _super !== null && _super.apply(this, arguments) || this;
                }
                TVAService.prototype.selectTVA = function (fields, sort, skip, take) {
                    var req = new dtos_1.SelectTVA();
                    req.Fields = fields;
                    req.Sort = sort;
                    if (skip) {
                        req.Skip = skip;
                    }
                    if (take) {
                        req.Take = take;
                    }
                    return this.client.get(req);
                };
                TVAService.prototype.deleteTVA = function (id) {
                    var req = new dtos_1.DeleteTVA();
                    req.CleTVA = id;
                    return this.client.delete(req);
                };
                return TVAService;
            }(service_client_1.ServiceClient));
            TVAService = __decorate([
                core_1.Injectable()
            ], TVAService);
            exports_1("TVAService", TVAService);
        }
    };
});
//# sourceMappingURL=tva.service.js.map