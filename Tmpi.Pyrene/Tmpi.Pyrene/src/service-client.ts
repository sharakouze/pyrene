import { JsonServiceClient } from 'servicestack-client';

import { AppSettings } from './appsettings';

export abstract class ServiceClient {
    protected client: JsonServiceClient;

    constructor(private appConfig: AppSettings) {
        this.client = new JsonServiceClient(this.appConfig.ApiEndpointUrl);
    }
}
