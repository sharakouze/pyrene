import { JsonServiceClient } from 'servicestack-client';

export class ServiceClientFactory {
    static create(): JsonServiceClient {
        return new JsonServiceClient('');
    }
}
