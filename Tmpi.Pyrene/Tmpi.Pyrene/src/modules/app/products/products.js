System.register(["@angular/core"], function (exports_1, context_1) {
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
    var core_1, ProductsComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            }
        ],
        execute: function () {
            ProductsComponent = (function () {
                function ProductsComponent() {
                    this.heading = "Products";
                }
                return ProductsComponent;
            }());
            ProductsComponent = __decorate([
                core_1.Component({
                    selector: 'products',
                    template: "\n        <section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">\n            <div class=\"mdl-card mdl-cell mdl-cell--12-col\">\n                <div class=\"mdl-card__supporting-text mdl-grid mdl-grid--no-spacing\">\n                <h4 class=\"mdl-cell mdl-cell--12-col\">{{heading}}</h4>\n                <div class=\"section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone\">\n                    <div class=\"section__circle-container__circle mdl-color--primary\"></div>\n                </div>\n                <div class=\"section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone\">\n                    <h5>Lorem ipsum dolor sit amet</h5>\n                    Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href=\"#\">proident minim</a>.\n                </div>\n                <div class=\"section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone\">\n                    <div class=\"section__circle-container__circle mdl-color--primary\"></div>\n                </div>\n                <div class=\"section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone\">\n                    <h5>Lorem ipsum dolor sit amet</h5>\n                    Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href=\"#\">proident minim</a>.\n                </div>\n                <div class=\"section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone\">\n                    <div class=\"section__circle-container__circle mdl-color--primary\"></div>\n                </div>\n                <div class=\"section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone\">\n                    <h5>Lorem ipsum dolor sit amet</h5>\n                    Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href=\"#\">proident minim</a>.\n                </div>\n                </div>\n                <div class=\"mdl-card__actions\">\n                <a href=\"#\" class=\"mdl-button\">Read our features</a>\n                </div>\n            </div>\n        </section>\n    "
                }),
                __metadata("design:paramtypes", [])
            ], ProductsComponent);
            exports_1("ProductsComponent", ProductsComponent);
        }
    };
});
//# sourceMappingURL=products.js.map