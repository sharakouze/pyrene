//------------------------------------------------------------------------------
// <auto-generated>
// Ce code a été généré par un outil.
//
// Les modifications apportées à ce fichier peuvent provoquer un comportement
// incorrect et seront perdues si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

import { Component, OnInit } from '@angular/core';

import { PagedData } from '../paged-data';
import { PersonneService } from './personne.service';
import { Personne } from '/dtos';

@Component({
	selector: 'personne-list',
	templateUrl: 'personne-list.component.html',
	providers: [PersonneService]
})
export class PersonneListComponent implements OnInit {
	personne: PagedData<Personne> = {
		sort: 'CodPersonne',
		pageIndex: 0,
		pageSize: 20
	}

	constructor(private personneService: PersonneService) {
	}

	ngOnInit() {
		this.loadPersonne();
	}

	loadPersonne(): void {
		const fields = 'CodPersonne,NomPersonne,EstActif';
		const skip = this.personne.pageIndex * this.personne.pageSize;
		this.personneService.selectPersonne(fields, [this.personne.sort], skip, this.personne.pageSize)
			.then(r => this.personne.data = r.Results);
	}

	deletePersonne(id: number): void {
		this.personneService.deletePersonne(id);
	}
}
