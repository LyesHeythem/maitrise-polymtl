import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "./app.component";
import { AnimauxComponent } from "./animaux/animaux.component";
import { TraitementComponent } from "./traitement/traitement.component";
import { InformationsAnimauxComponent } from "./informationsAnimaux/informationsAnimaux.component";
import { ArchiveAnimauxComponent } from "./archiveAnimaux/archiveAnimaux.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "traitement", component: TraitementComponent },
  { path: "animaux", component: AnimauxComponent },
  { path: "informationsAnimaux", component: InformationsAnimauxComponent },
  { path: "archiveAnimaux", component: ArchiveAnimauxComponent }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
