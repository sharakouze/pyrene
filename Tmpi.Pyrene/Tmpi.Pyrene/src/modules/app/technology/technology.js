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
    var core_1, TechnologyComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            }
        ],
        execute: function () {
            TechnologyComponent = (function () {
                function TechnologyComponent() {
                    this.heading = "Technology";
                }
                return TechnologyComponent;
            }());
            TechnologyComponent = __decorate([
                core_1.Component({
                    selector: 'technology',
                    template: "\n        <section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">\n            <div class=\"mdl-card mdl-cell mdl-cell--12-col\">\n                <div class=\"mdl-card__supporting-text\">\n                    <h4>{{heading}}</h4>\n                    Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. \n                    Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse. \n                    Pariatur occaecat nisi laboris tempor laboris eiusmod qui id Lorem esse commodo in. \n                    Exercitation aute dolore deserunt culpa consequat elit labore incididunt elit anim.\n                </div>\n                <div class=\"mdl-card__actions\">\n                    <a href=\"#\" class=\"mdl-button\">Read our features</a>\n                </div>\n            </div>\n        </section>\n    "
                }),
                __metadata("design:paramtypes", [])
            ], TechnologyComponent);
            exports_1("TechnologyComponent", TechnologyComponent);
        }
    };
});
//# sourceMappingURL=technology.js.map