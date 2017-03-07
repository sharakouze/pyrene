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
import { SelectTVA, SelectTVAResponse, DeleteTVA } from '../../dtos';

@Injectable()
export class TVAService extends ServiceClient {
	selectTVA(fields: string, sort: string[], skip?: number, take?: number): Promise<SelectTVAResponse> {
		const req = new SelectTVA();
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

	deleteTVA(id: number): Promise<void> {
		const req = new DeleteTVA();
		req.CleTVA = id;

		return this.client.delete(req);
	}

}
