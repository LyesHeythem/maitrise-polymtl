import { Component} from "@angular/core";
import { Animal } from "../../../../common/tables/Animal";
import { CommunicationService } from "../communication.service";

@Component({
  selector: "app-informationsAnimaux",
  templateUrl: "./informationsAnimaux.component.html",
  styleUrls: ["./informationsAnimaux.component.css"]
})
export class InformationsAnimauxComponent {
  public constructor(private communicationService: CommunicationService) { }

  public duplicateError: boolean = false;
  public animal: Animal[] = [];

  public getInfosAnimal(nom: string): void {
    this.communicationService.getInfosAnimal(nom).subscribe((animal: Animal[]) => {
      this.animal = animal;
    });
  }
}
