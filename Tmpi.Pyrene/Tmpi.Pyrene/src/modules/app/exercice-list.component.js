System.register(["@angular/core", "./exercice.service"], function (exports_1, context_1) {
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
    var core_1, exercice_service_1, ExerciceListComponent;
    return {
        setters: [
            function (core_1_1) {
                core_1 = core_1_1;
            },
            function (exercice_service_1_1) {
                exercice_service_1 = exercice_service_1_1;
            }
        ],
        execute: function () {
            ExerciceListComponent = (function () {
                function ExerciceListComponent(exerciceService) {
                    this.exerciceService = exerciceService;
                    this.exercice = {
                        sort: 'LibExercice',
                        pageIndex: 0,
                        pageSize: 20
                    };
                }
                ExerciceListComponent.prototype.ngOnInit = function () {
                    this.loadExercice();
                };
                ExerciceListComponent.prototype.loadExercice = function () {
                    var _this = this;
                    var fields = 'CodExercice,LibExercice,EstActif';
                    var skip = this.exercice.pageIndex * this.exercice.pageSize;
                    this.exerciceService.selectExercice(fields, [this.exercice.sort], skip, this.exercice.pageSize)
                        .then(function (r) { return _this.exercice.data = r.Results; });
                };
                ExerciceListComponent.prototype.deleteExercice = function (id) {
                    this.exerciceService.deleteExercice(id);
                };
                return ExerciceListComponent;
            }());
            ExerciceListComponent = __decorate([
                core_1.Component({
                    selector: 'exercice-list',
                    templateUrl: 'exercice-list.component.html',
                    providers: [exercice_service_1.ExerciceService]
                }),
                __metadata("design:paramtypes", [exercice_service_1.ExerciceService])
            ], ExerciceListComponent);
            exports_1("ExerciceListComponent", ExerciceListComponent);
        }
    };
});
//# sourceMappingURL=exercice-list.component.js.map