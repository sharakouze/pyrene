import { Injectable } from '@angular/core';
import { JsonServiceClient } from 'servicestack-client';

import { SelectCompteur, SelectCompteurResponse } from '../dtos';

@Injectable()
export class CompteurService {
	selectCompteur(fields: string, sort: string, plop:number, skip?: number, take?: number): Promise<SelectCompteurResponse> {
		const req = new SelectCompteur();
		req.Fields = fields;
		req.Sort = [sort];
		if (skip) {
			req.Skip = skip;
		}
		if (take) {
			req.Take = take;
		}

		const client = new JsonServiceClient('');
		return client.get(req);
	}
}
