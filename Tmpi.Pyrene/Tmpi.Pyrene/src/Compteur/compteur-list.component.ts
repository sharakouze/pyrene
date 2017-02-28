import { Component, OnInit } from '@angular/core';
import { JsonServiceClient } from 'servicestack-client';
import { SelectCompteur } from '../dtos';

@Component({
	selector: 'compteur-list',
	templateUrl: 'compteur-list.component.html'
})
export class CompteurListComponent implements OnInit {
	ngOnInit() {
		this.loadCompteurList();
	}

	load() {
	var req = new Select{0}();
	var client = new JsonServiceClient();
	client.get(req);
	}
}
