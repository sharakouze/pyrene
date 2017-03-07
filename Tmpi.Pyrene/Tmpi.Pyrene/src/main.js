System.register(["zone.js", "reflect-metadata", "@angular/platform-browser-dynamic", "./main.module"], function (exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var platform_browser_dynamic_1, main_module_1;
    return {
        setters: [
            function (_1) {
            },
            function (_2) {
            },
            function (platform_browser_dynamic_1_1) {
                platform_browser_dynamic_1 = platform_browser_dynamic_1_1;
            },
            function (main_module_1_1) {
                main_module_1 = main_module_1_1;
            }
        ],
        execute: function () {
            platform_browser_dynamic_1.platformBrowserDynamic().bootstrapModule(main_module_1.MainModule);
        }
    };
});
//# sourceMappingURL=main.js.map