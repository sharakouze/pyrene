import { Component, OnInit } from '@angular/core';

import { CompteurService } from './compteur.service';
import { SelectCompteurResponse } from '../dtos';

@Component({
	selector: 'compteur-list',
	templateUrl: 'compteur-list.component.html',
	providers: [CompteurService]
})
export class CompteurListComponent implements OnInit {
	result: SelectCompteurResponse;

	constructor(private compteurService: CompteurService) {
	}

	ngOnInit() {
		this.load();
	}

	load(): void {
		this.compteurService.selectCompteur('','',null,0);
	}
}
