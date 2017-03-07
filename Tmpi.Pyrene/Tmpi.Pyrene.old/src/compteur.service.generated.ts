//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

import { Injectable } from '@angular/core';

import { ServiceClient } from '/service-client';
import { SelectCompteur, SelectCompteurResponse, DeleteCompteur } from '/dtos';

@Injectable()
export class CompteurService extends ServiceClient {
	selectCompteur(fields: string, sort: string[], skip?: number, take?: number): Promise<SelectCompteurResponse> {
		const req = new SelectCompteur();
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

	deleteCompteur(id: number): Promise<void> {
		const req = new DeleteCompteur();
		req.CleCompteur = id;

		return this.client.delete(req);
	}

}
