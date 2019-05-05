import { Component, OnInit} from "@angular/core";
import { Animal } from "../../../../common/tables/Animal";
import { CommunicationService } from "../communication.service";

@Component({
  selector: "app-archiveAnimaux",
  templateUrl: "./archiveAnimaux.component.html",
  styleUrls: ["./archiveAnimaux.component.css"]
})
export class ArchiveAnimauxComponent implements OnInit{
  public constructor(private communicationService: CommunicationService) { }

  public duplicateError: boolean = false;
  public animal: Animal[] = [];

  public getInfosAnimal(nom: string): void {
    this.communicationService.getInfosAnimal(nom).subscribe((animal: Animal[]) => {
      this.animal = animal;
    });
  }

  public animaux: any[];

  public ngOnInit(): void {
    this.communicationService.getArchive().subscribe((animaux: any) => {
      console.log(animaux);
      this.animaux = animaux;
    });
  }
}
