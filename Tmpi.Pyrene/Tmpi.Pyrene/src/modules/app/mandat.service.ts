//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

import { Injectable } from '@angular/core';

import { ServiceClient } from '../../service-client';
import { SelectMandat, SelectMandatResponse, DeleteMandat } from '../../dtos';

@Injectable()
export class MandatService extends ServiceClient {
	selectMandat(fields: string, sort: string[], skip?: number, take?: number): Promise<SelectMandatResponse> {
		const req = new SelectMandat();
		req.Fields = fields;
		req.Sort = sort;
		if (skip) {
			req.Skip = skip;
		}
		if (take) {
			req.Take = take;
		}

		return this.client.get(req);
	}

	deleteMandat(id: number): Promise<void> {
		const req = new DeleteMandat();
		req.CleMandat = id;

		return this.client.delete(req);
	}

}
