System.register(["servicestack-client"], function (exports_1, context_1) {
    "use strict";
    var __moduleName = context_1 && context_1.id;
    var servicestack_client_1, ServiceClientFactory;
    return {
        setters: [
            function (servicestack_client_1_1) {
                servicestack_client_1 = servicestack_client_1_1;
            }
        ],
        execute: function () {
            ServiceClientFactory = (function () {
                function ServiceClientFactory() {
                }
                ServiceClientFactory.create = function () {
                    return new servicestack_client_1.JsonServiceClient('');
                };
                return ServiceClientFactory;
            }());
            exports_1("ServiceClientFactory", ServiceClientFactory);
        }
    };
});
//# sourceMappingURL=serviceclientfactory.js.map