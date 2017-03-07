System.register(["servicestack-client"], function (exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var servicestack_client_1, ServiceClient;
    return {
        setters: [
            function (servicestack_client_1_1) {
                servicestack_client_1 = servicestack_client_1_1;
            }
        ],
        execute: function () {
            ServiceClient = (function () {
                function ServiceClient(appConfig) {
                    this.appConfig = appConfig;
                    this.client = new servicestack_client_1.JsonServiceClient('/');
                }
                return ServiceClient;
            }());
            exports_1("ServiceClient", ServiceClient);
        }
    };
});
//# sourceMappingURL=service-client.js.map