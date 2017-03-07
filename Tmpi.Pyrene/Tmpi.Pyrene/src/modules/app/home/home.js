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
    var core_1, HomeComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            }
        ],
        execute: function () {
            HomeComponent = (function () {
                function HomeComponent() {
                    this.heading = "Home";
                }
                return HomeComponent;
            }());
            HomeComponent = __decorate([
                core_1.Component({
                    selector: 'home',
                    template: "\n        <section class=\"section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp\">\n            <header class=\"section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white\">\n                <i class=\"material-icons\">play_circle_filled</i>\n            </header>\n\n            <div class=\"mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone\">\n\n                <hello [heading]=\"heading\"></hello> \n\n                <div class=\"mdl-card__actions\">\n                    <a href=\"http://docs.servicestack.net/typescript-add-servicestack-reference\" class=\"mdl-button\">More info on TypeScript ServiceStack Reference</a>\n                </div>\n            </div>\n        </section>\n    "
                }),
                __metadata("design:paramtypes", [])
            ], HomeComponent);
            exports_1("HomeComponent", HomeComponent);
        }
    };
});
//# sourceMappingURL=home.js.map