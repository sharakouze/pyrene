"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var core_1 = require("@angular/core");
var servicestack_client_1 = require("servicestack-client");
var dtos_1 = require("../dtos");
var CompteurService = (function () {
    function CompteurService() {
    }
    CompteurService.prototype.selectCompteur = function (fields, sort, plop, skip, take) {
        var req = new dtos_1.SelectCompteur();
        req.Fields = fields;
        req.Sort = [sort];
        if (skip) {
            req.Skip = skip;
        }
        if (take) {
            req.Take = take;
        }
        var client = new servicestack_client_1.JsonServiceClient('');
        return client.get(req);
    };
    return CompteurService;
}());
CompteurService = __decorate([
    core_1.Injectable()
], CompteurService);
exports.CompteurService = CompteurService;
