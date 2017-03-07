System.register(["@angular/core"], function (exports_1, context_1) {
    "use strict";
    var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
        var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
        if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
        else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
        return c > 3 && r && Object.defineProperty(target, key, r), r;
    };
    var __moduleName = context_1 && context_1.id;
    var core_1, FooterComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            }
        ],
        execute: function () {
            FooterComponent = (function () {
                function FooterComponent() {
                }
                return FooterComponent;
            }());
            FooterComponent = __decorate([
                core_1.Component({
                    selector: 'app-footer',
                    template: "\n        <section class=\"section--footer mdl-grid\"></section>\n        <footer class=\"mdl-mega-footer\">\n            <div class=\"mdl-mega-footer--middle-section\">\n                <div class=\"mdl-mega-footer--drop-down-section\">\n                    <input class=\"mdl-mega-footer--heading-checkbox\" type=\"checkbox\" checked>\n                    <h1 class=\"mdl-mega-footer--heading\">Features</h1>\n                    <ul class=\"mdl-mega-footer--link-list\">\n                        <li><a href=\"#\">About</a></li>\n                        <li><a href=\"#\">Terms</a></li>\n                        <li><a href=\"#\">Partners</a></li>\n                        <li><a href=\"#\">Updates</a></li>\n                    </ul>\n                </div>\n                <div class=\"mdl-mega-footer--drop-down-section\">\n                    <input class=\"mdl-mega-footer--heading-checkbox\" type=\"checkbox\" checked>\n                    <h1 class=\"mdl-mega-footer--heading\">Details</h1>\n                    <ul class=\"mdl-mega-footer--link-list\">\n                        <li><a href=\"#\">Spec</a></li>\n                        <li><a href=\"#\">Tools</a></li>\n                        <li><a href=\"#\">Resources</a></li>\n                    </ul>\n                </div>\n                <div class=\"mdl-mega-footer--drop-down-section\">\n                    <input class=\"mdl-mega-footer--heading-checkbox\" type=\"checkbox\" checked>\n                    <h1 class=\"mdl-mega-footer--heading\">Technology</h1>\n                    <ul class=\"mdl-mega-footer--link-list\">\n                        <li><a href=\"#\">How it works</a></li>\n                        <li><a href=\"#\">Patterns</a></li>\n                        <li><a href=\"#\">Usage</a></li>\n                        <li><a href=\"#\">Products</a></li>\n                        <li><a href=\"#\">Contracts</a></li>\n                    </ul>\n                </div>\n                <div class=\"mdl-mega-footer--drop-down-section\">\n                    <input class=\"mdl-mega-footer--heading-checkbox\" type=\"checkbox\" checked>\n                    <h1 class=\"mdl-mega-footer--heading\">FAQ</h1>\n                    <ul class=\"mdl-mega-footer--link-list\">\n                        <li><a href=\"#\">Questions</a></li>\n                        <li><a href=\"#\">Answers</a></li>\n                        <li><a href=\"#\">Contact us</a></li>\n                    </ul>\n                </div>\n            </div>\n            <div class=\"mdl-mega-footer--bottom-section\">\n                <div class=\"mdl-logo\">\n                    More Information\n                </div>\n                <ul class=\"mdl-mega-footer--link-list\">\n                    <li><a href=\"https://github.com/ServiceStack/ServiceStackVS\">ServiceStack VS.NET Templates</a></li>\n                </ul>\n            </div>\n        </footer>\n    "
                })
            ], FooterComponent);
            exports_1("FooterComponent", FooterComponent);
        }
    };
});
//# sourceMappingURL=footer.js.map