import {Component} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {AwaitHttpClient} from "./await-http-client.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';

  constructor(http: HttpClient, private awaitHttp: AwaitHttpClient) {
    http.get("https://api.devexp.io/utenti").subscribe(success => {
      console.log(success)
    }, error => {
      console.log(error)
    })

    this.loadUsers()
  }

  async loadUsers(){
    let utenti = await this.awaitHttp.get("https://api.devexp.io/utenti")
    console.log(utenti)
  }
}
