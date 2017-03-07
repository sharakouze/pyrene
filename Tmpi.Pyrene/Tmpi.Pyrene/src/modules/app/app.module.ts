import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { RouterModule, Routes, Router, ActivatedRoute } from '@angular/router';

import { HeaderComponent } from '../../shared/header';
import { FooterComponent } from '../../shared/footer';
import { HomeComponent } from './home/home';
import { HelloComponent } from './home/hello';
import { ProductsComponent } from './products/products';
import { TechnologyComponent } from './technology/technology';
import { CompteurListComponent } from './compteur-list.component';

export const routes: Routes = [
    {
        path: '',
        redirectTo: '/home',
        pathMatch: 'full'
    },
    { path: 'home', component: HomeComponent, data: { title: 'Home', routeParam: 'Welcome' } },
    { path: 'products', component: ProductsComponent, data: { title: 'Products' } },
    { path: 'technology', component: TechnologyComponent, data: { title: 'Technology' } },
    { path: 'compteurlist', component: CompteurListComponent, data: { title: 'Compteur' } }
];

@NgModule({
    declarations: [
        HomeComponent,
        HelloComponent,
        ProductsComponent,
        TechnologyComponent,
        CompteurListComponent
    ],
    imports: [
        BrowserModule,
        FormsModule,
        RouterModule.forRoot(routes)
    ]
})
export class AppModule { }
