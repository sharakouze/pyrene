System.register(["@angular/core", "@angular/router", "../modules/app/app.module"], function (exports_1, context_1) {
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
    var core_1, router_1, app_module_1, HeaderComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (app_module_1_1) {
                app_module_1 = app_module_1_1;
            }
        ],
        execute: function () {
            HeaderComponent = (function () {
                function HeaderComponent(route, router) {
                    this.route = route;
                    this.router = router;
                    this.title = 'Tmpi.Pyrene';
                    this.routes = app_module_1.routes.filter(function (val) { return val.path != ''; });
                }
                HeaderComponent.prototype.isActive = function (path) {
                    return this.router.url.substring(1) === path;
                };
                return HeaderComponent;
            }());
            HeaderComponent = __decorate([
                core_1.Component({
                    selector: 'app-header',
                    template: "\n        <header mdl class=\"mdl-layout__header mdl-layout__header--scroll mdl-color--primary\">\n            <div class=\"mdl-layout--large-screen-only mdl-layout__header-row\"></div>\n            <div class=\"mdl-layout--large-screen-only mdl-layout__header-row\">\n                <h3>{{title}}</h3>\n            </div>\n            <div class=\"mdl-layout--large-screen-only mdl-layout__header-row\"></div>\n            <div class=\"mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark\">\n\n                <span *ngFor=\"let route of routes\">\n                    <a class=\"mdl-layout__tab\" [class.is-active]=\"isActive(route.path)\"\n                        routerLink=\"{{route.path}}\">{{route.data.title}}</a>\n                </span>\n\n                <button class=\"mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--4dp mdl-color--accent\" id=\"add\">\n                    <i class=\"material-icons\" role=\"presentation\">add</i>\n                    <span class=\"visuallyhidden\">Add</span>\n                </button>\n            </div>\n        </header>\n    "
                }),
                __metadata("design:paramtypes", [router_1.ActivatedRoute, router_1.Router])
            ], HeaderComponent);
            exports_1("HeaderComponent", HeaderComponent);
        }
    };
});
//# sourceMappingURL=header.js.map