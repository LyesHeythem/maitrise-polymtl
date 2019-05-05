import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Animal } from '../../../common/tables/Animal';
import { Traitement } from '../../../common/tables/Traitement';
// tslint:disable-next-line:ordered-imports
import { of, Observable,concat, Subject } from "rxjs";
import { catchError } from "rxjs/operators";

@Injectable()
export class CommunicationService {

    private readonly BASE_URL: string = "http://localhost:3000/database";
    public constructor(private http: HttpClient) { }

    private _listners: any = new Subject<any>();

    public listen(): Observable<any> {
       return this._listners.asObservable();
    }

    public filter(filterBy: string): void {
       this._listners.next(filterBy);
    }

    public insertAnimal(animal: Animal): Observable<number> {
        return this.http.post<number>(this.BASE_URL + "/animaux/insert", animal).pipe(
            catchError(this.handleError<number>("insertAnimal")),
        );
    }

    public modifyAnimal(animal: Animal): Observable<number> {
        return this.http.post<number>(this.BASE_URL + "/animaux/modify", animal).pipe(
            catchError(this.handleError<number>("modifyAnimal")),
        );
    }

  public deleteAnimal(animal: any): Observable<number> {
    return this.http.post<number>(this.BASE_URL + "/animaux/delete", animal).pipe(
            catchError(this.handleError<number>("deleteAnimal")),
        );
    }

    public getTraitement(IdAnimal: string, IdClin: string): Observable<any[]> {
      return this.http.get<Traitement[]>(this.BASE_URL + "/traitement?idanimal=" + IdAnimal + "&idclin=" + IdClin).pipe(
            catchError(this.handleError<Traitement[]>("getTraitement")),
        );
    }

    public getCliniquesId(): Observable<any[]> {

      return this.http.get<any[]>(this.BASE_URL + "/clinique/id").pipe(
            catchError(this.handleError<any[]>("getCliniquesId")),
      );
    }

    public getProprietairesId(): Observable<any[]> {

      return this.http.get<any[]>(this.BASE_URL + "/proprietaire/id").pipe(
            catchError(this.handleError<any[]>("getProprietairesId")),
      );
    }

    public getAnimauxId(): Observable<any[]> {

      return this.http.get<any[]>(this.BASE_URL + "/animaux/id").pipe(
            catchError(this.handleError<any[]>("getAnimauxId")),
      );
    }

    public getFacture(IdAnimal: string, IdClin: string): Observable<any[]> {

      return this.http.get<Traitement[]>(this.BASE_URL + "/traitement/facture?idanimal=" + IdAnimal + "&idclin=" + IdClin).pipe(
            catchError(this.handleError<Traitement[]>("getFacture")),
        );
    }

    public getInfosAnimal(nom: string): Observable<any[]> {

        return this.http.get<Animal[]>(this.BASE_URL + "/animal/informationsAnimal?nom=" + nom).pipe(
            catchError(this.handleError<Traitement[]>("getInfosAnimal")),
        );
    }

    public getArchive(): Observable<any[]> {

      return this.http.get<Animal[]>(this.BASE_URL + "/archive").pipe(
          catchError(this.handleError<Traitement[]>("getArchive")),
      );
    }

    public setUpDatabase(): Observable<any> {
        return concat(this.http.post<any>(this.BASE_URL + "/createSchema", []),
                      this.http.post<any>(this.BASE_URL + "/populateDb", []));
    }

    private handleError<T>(request: string, result?: T): (error: Error) => Observable<T> {

        return (error: Error): Observable<T> => {
            return of(result as T);
        };
    }
}
