//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

import { Component, OnInit } from '@angular/core';

import { PagedData } from '../../paged-data';
import { CompteurService } from './compteur.service';
import { Compteur } from '../../dtos';

@Component({
	selector: 'compteur-list',
    template: require('./compteur-list.cdomponent.html'),
	providers: [CompteurService]
})
export class CompteurListComponent implements OnInit {
	compteur: PagedData<Compteur> = {
		sort: 'LibCompteur',
		pageIndex: 0,
		pageSize: 20
	}

	constructor(private compteurService: CompteurService) {
	}

	ngOnInit() {
		this.loadCompteur();
	}

	loadCompteur(): void {
		const fields = 'CodCompteur,LibCompteur,EstActif,TypCompteur,Service(CodService)';
		const skip = this.compteur.pageIndex * this.compteur.pageSize;
		this.compteurService.selectCompteur(fields, [this.compteur.sort], skip, this.compteur.pageSize)
			.then(r => this.compteur.data = r.Results);
	}

	deleteCompteur(id: number): void {
		this.compteurService.deleteCompteur(id);
	}
}
