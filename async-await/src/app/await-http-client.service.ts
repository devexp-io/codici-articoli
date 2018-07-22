import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class AwaitHttpClient {

  constructor(private http:HttpClient) { }

  get(url:string){
    let p = new Promise((res, rej)=> {
      this.http.get(url).subscribe(success => res(success), error => rej(error))
    })
    return p
  }
}
