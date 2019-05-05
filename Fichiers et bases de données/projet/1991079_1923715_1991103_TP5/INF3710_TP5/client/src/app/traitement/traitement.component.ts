import { Component, OnInit} from "@angular/core";
import { Traitement } from "../../../../common/tables/Traitement";
import { CommunicationService } from "../communication.service";

@Component({
  selector: "app-traitement",
  templateUrl: "./traitement.component.html",
  styleUrls: ["./traitement.component.css"]
})
export class TraitementComponent implements OnInit{
  public constructor(private communicationService: CommunicationService) { }

  public traitement: Traitement[] = [];
  public duplicateError: boolean = false;
  public facture: any[];
  

  public getTraitement(IdAnimal: string, IdClin: string): void {
    this.communicationService.getTraitement(IdAnimal, IdClin).subscribe((traitement: Traitement[]) => {
      this.traitement = traitement;
    });
  }

  public getFacture(IdAnimal: string, IdClin: string): void {
    this.communicationService.getFacture(IdAnimal, IdClin).subscribe((fact: any[]) => {
      this.facture = fact;
    });
  }

  public clinique: any[];
  public animaux: any[];

  public ngOnInit(): void {
    this.communicationService.getCliniquesId().subscribe((clinique: any) => {
      this.clinique = clinique;
    });
    this.communicationService.getAnimauxId().subscribe((animaux: any) => {
      this.animaux = animaux;
    });
  }
}
