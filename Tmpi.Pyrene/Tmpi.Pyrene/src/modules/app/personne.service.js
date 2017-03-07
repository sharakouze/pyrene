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
    var core_1, service_client_1, dtos_1, PersonneService;
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
            PersonneService = (function (_super) {
                __extends(PersonneService, _super);
                function PersonneService() {
                    return _super !== null && _super.apply(this, arguments) || this;
                }
                PersonneService.prototype.selectPersonne = function (fields, sort, skip, take) {
                    var req = new dtos_1.SelectPersonne();
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
                PersonneService.prototype.deletePersonne = function (id) {
                    var req = new dtos_1.DeletePersonne();
                    req.ClePersonne = id;
                    return this.client.delete(req);
                };
                return PersonneService;
            }(service_client_1.ServiceClient));
            PersonneService = __decorate([
                core_1.Injectable()
            ], PersonneService);
            exports_1("PersonneService", PersonneService);
        }
    };
});
//# sourceMappingURL=personne.service.js.map