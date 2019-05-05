import { Component, OnInit } from "@angular/core";
import { CommunicationService } from "./../communication.service";
import { Animal } from "../../../../common/tables/Animal";

@Component({
  selector: "app-animaux",
  templateUrl: "./animaux.component.html",
  styleUrls: ["./animaux.component.css"]
})

export class AnimauxComponent implements OnInit{

  public constructor(private communicationService: CommunicationService) { }

  public duplicateError: boolean = false;

  public insertAnimal(IdAnimal: string, IdClin: string, IdProp: string, nom: string, type: string, description: string, dateNaissance: Date, dateInscriptionClinique: Date, EtatActuel: string): void {
    const animal: Animal = {
      "idanimal": IdAnimal,
      "idclin": IdClin,
      "idprop": IdProp,
      "nom": nom,
      "type": type,
      "description": description,
      "datenaissance": dateNaissance,
      "dateinscriptionclinique": dateInscriptionClinique,
      "etatactuel": EtatActuel
    };
    this.communicationService.insertAnimal(animal).subscribe((res: number) => {
        if (res > 0) {
            this.communicationService.filter("update");
        }
        this.duplicateError = (res === -1);
    });
  }

  public modifyAnimal(IdAnimal: string, IdClin: string, IdProp: string, nom: string, type: string, description: string, dateNaissance: Date, dateInscriptionClinique: Date, EtatActuel: string): void {
    const animal: Animal = {
      "idanimal": IdAnimal,
      "idclin": IdClin,
      "idprop": IdProp,
      "nom": nom,
      "type": type,
      "description": description,
      "datenaissance": dateNaissance,
      "dateinscriptionclinique": dateInscriptionClinique,
      "etatactuel": EtatActuel
    };
    this.communicationService.modifyAnimal(animal).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
      }
      this.duplicateError = (res === -1);
    });
  }

  public deleteAnimal(IdAnimal: string, IdClin: string): void {
    const animal: any = {
      "idanimal": IdAnimal,
      "idclin": IdClin
    };
    this.communicationService.deleteAnimal(animal).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
      }
      this.duplicateError = (res === -1);
    });
  }

  public clinique: any[];
  public proprietaire: any[];
  public animaux: any[];

  public ngOnInit(): void {
    this.communicationService.getCliniquesId().subscribe((clinique: any) => {
      this.clinique = clinique;
    });
    this.communicationService.getProprietairesId().subscribe((proprietaire: any) => {
      this.proprietaire = proprietaire;
    });
    this.communicationService.getAnimauxId().subscribe((animaux: any) => {
      this.animaux = animaux;
    });
  }

  public getAnimauxId(): void {
    this.communicationService.getAnimauxId().subscribe((animaux: any) => {
      this.animaux = animaux;
    });
  }
}




