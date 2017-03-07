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
import { ExerciceService } from './exercice.service';
import { Exercice } from '../../dtos';

@Component({
	selector: 'exercice-list',
	templateUrl: 'exercice-list.component.html',
	providers: [ExerciceService]
})
export class ExerciceListComponent implements OnInit {
	exercice: PagedData<Exercice> = {
		sort: 'LibExercice',
		pageIndex: 0,
		pageSize: 20
	}

	constructor(private exerciceService: ExerciceService) {
	}

	ngOnInit() {
		this.loadExercice();
	}

	loadExercice(): void {
		const fields = 'CodExercice,LibExercice,EstActif';
		const skip = this.exercice.pageIndex * this.exercice.pageSize;
		this.exerciceService.selectExercice(fields, [this.exercice.sort], skip, this.exercice.pageSize)
			.then(r => this.exercice.data = r.Results);
	}

	deleteExercice(id: number): void {
		this.exerciceService.deleteExercice(id);
	}
}
