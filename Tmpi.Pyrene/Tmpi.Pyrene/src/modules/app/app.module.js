System.register(["@angular/core", "@angular/platform-browser", "@angular/forms", "@angular/router", "./home/home", "./home/hello", "./products/products", "./technology/technology", "./compteur-list.component"], function (exports_1, context_1) {
    "use strict";
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, platform_browser_1, forms_1, router_1, home_1, hello_1, products_1, technology_1, compteur_list_component_1, routes, AppModule;
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
            function (router_1_1) {
                router_1 = router_1_1;
            },
            function (home_1_1) {
                home_1 = home_1_1;
            },
            function (hello_1_1) {
                hello_1 = hello_1_1;
            },
            function (products_1_1) {
                products_1 = products_1_1;
            },
            function (technology_1_1) {
                technology_1 = technology_1_1;
            },
            function (compteur_list_component_1_1) {
                compteur_list_component_1 = compteur_list_component_1_1;
            }
        ],
        execute: function () {
            exports_1("routes", routes = [
                {
                    path: '',
                    redirectTo: '/home',
                    pathMatch: 'full'
                },
                { path: 'home', component: home_1.HomeComponent, data: { title: 'Home', routeParam: 'Welcome' } },
                { path: 'products', component: products_1.ProductsComponent, data: { title: 'Products' } },
                { path: 'technology', component: technology_1.TechnologyComponent, data: { title: 'Technology' } },
                { path: 'compteurlist', component: compteur_list_component_1.CompteurListComponent, data: { title: 'Compteur' } }
            ]);
            AppModule = (function () {
                function AppModule() {
                }
                return AppModule;
            }());
            AppModule = __decorate([
                core_1.NgModule({
                    declarations: [
                        home_1.HomeComponent,
                        hello_1.HelloComponent,
                        products_1.ProductsComponent,
                        technology_1.TechnologyComponent,
                        compteur_list_component_1.CompteurListComponent
                    ],
                    imports: [
                        platform_browser_1.BrowserModule,
                        forms_1.FormsModule,
                        router_1.RouterModule.forRoot(routes)
                    ]
                })
            ], AppModule);
            exports_1("AppModule", AppModule);
        }
    };
});
//# sourceMappingURL=app.module.js.map