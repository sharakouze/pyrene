System.register(["@angular/core", "@angular/platform-browser", "@angular/forms", "@angular/http", "@angular/router", "./app", "./shared/header", "./shared/footer", "./modules/app/app.module"], function (exports_1, context_1) {
    "use strict";
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, platform_browser_1, forms_1, http_1, router_1, app_1, header_1, footer_1, app_module_1, routes, MainModule;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (platform_browser_1_1) {
                platform_browser_1 = platform_browser_1_1;
            },
            function (forms_1_1) {
                forms_1 = forms_1_1;
            },
            function (http_1_1) {
                http_1 = http_1_1;
            },
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (app_1_1) {
                app_1 = app_1_1;
            },
            function (header_1_1) {
                header_1 = header_1_1;
            },
            function (footer_1_1) {
                footer_1 = footer_1_1;
            },
            function (app_module_1_1) {
                app_module_1 = app_module_1_1;
            }
        ],
        execute: function () {
            routes = [
                { path: '', redirectTo: 'main/0', pathMatch: 'full' },
            ];
            MainModule = (function () {
                function MainModule() {
                }
                return MainModule;
            }());
            MainModule = __decorate([
                core_1.NgModule({
                    declarations: [
                        app_1.AppComponent,
                        header_1.HeaderComponent,
                        footer_1.FooterComponent
                    ],
                    imports: [
                        platform_browser_1.BrowserModule,
                        forms_1.FormsModule,
                        http_1.HttpModule,
                        router_1.RouterModule.forRoot(routes),
                        app_module_1.AppModule
                    ],
                    providers: [],
                    bootstrap: [app_1.AppComponent]
                })
            ], MainModule);
            exports_1("MainModule", MainModule);
        }
    };
});
//# sourceMappingURL=main.module.js.map