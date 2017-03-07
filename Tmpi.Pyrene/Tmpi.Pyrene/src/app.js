System.register(["@angular/core"], function (exports_1, context_1) {
    "use strict";
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, AppComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            }
        ],
        execute: function () {
            AppComponent = (function () {
                function AppComponent() {
                }
                AppComponent.prototype.ngAfterViewInit = function () {
                    componentHandler.upgradeDom();
                };
                return AppComponent;
            }());
            AppComponent = __decorate([
                core_1.Component({
                    selector: 'app-root',
                    template: "\n    <div class=\"mdl-layout mdl-js-layout mdl-layout--fixed-header\">\n\n        <app-header></app-header>\n\n        <main class=\"mdl-layout__content\">\n\n            <div class=\"mdl-layout__tab-panel is-active\" id=\"overview\">\n                <router-outlet></router-outlet>\n            </div>\n\n            <h4 style=\"text-align: center\">\n                <a href=\"https://servicestack.net/vs-templates/Angular2App\">Learn about this Angular2 VS.NET template</a>\n            </h4>\n\n            <app-footer></app-footer>\n\n        </main>\n    </div>\n    "
                })
            ], AppComponent);
            exports_1("AppComponent", AppComponent);
        }
    };
});
//# sourceMappingURL=app.js.map