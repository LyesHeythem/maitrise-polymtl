import { CommonModule } from "@angular/common";
import { HttpClientModule } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { CommunicationService } from "./communication.service";
import { AnimauxComponent } from "./animaux/animaux.component";
import { TraitementComponent } from "./traitement/traitement.component";
import { InformationsAnimauxComponent } from "./informationsAnimaux/informationsAnimaux.component";
import { ArchiveAnimauxComponent } from "./archiveAnimaux/archiveAnimaux.component";

@NgModule({
  declarations: [
    AppComponent,
    TraitementComponent,
    AnimauxComponent,
    InformationsAnimauxComponent,
    ArchiveAnimauxComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule
  ],
  providers: [CommunicationService],
  bootstrap: [AppComponent],
})
export class AppModule { }
