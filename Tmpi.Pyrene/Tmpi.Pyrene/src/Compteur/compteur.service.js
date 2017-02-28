System.register(["@angular/core", "servicestack-client", "../appsettings", "../dtos"], function (exports_1, context_1) {
    "use strict";
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, servicestack_client_1, appsettings_1, dtos_1, CompteurService;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (servicestack_client_1_1) {
                servicestack_client_1 = servicestack_client_1_1;
            },
            function (appsettings_1_1) {
                appsettings_1 = appsettings_1_1;
            },
            function (dtos_1_1) {
                dtos_1 = dtos_1_1;
            }
        ],
        execute: function () {
            CompteurService = (function () {
                function CompteurService() {
                }
                CompteurService.prototype.selectCompteur = function (fields, sort, skip, take) {
                    var req = new dtos_1.SelectCompteur();
                    req.Fields = fields;
                    req.Sort = sort;
                    if (skip) {
                        req.Skip = skip;
                    }
                    if (take) {
                        req.Take = take;
                    }
                    var client = new servicestack_client_1.JsonServiceClient(appsettings_1.AppSettings.Url);
                    return client.get(req);
                };
                return CompteurService;
            }());
            CompteurService = __decorate([
                core_1.Injectable()
            ], CompteurService);
            exports_1("CompteurService", CompteurService);
        }
    };
});
//# sourceMappingURL=compteur.service.js.map