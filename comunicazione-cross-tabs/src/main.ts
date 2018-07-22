import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

if (environment.production) {
  enableProdMode();
}

platformBrowserDynamic().bootstrapModule(AppModule);

window.addEventListener("message", receiveMessage, false);

function receiveMessage(event)
{
  console.log(event)
  console.log(event.data)
  if (event.origin !== "http://localhost:4200" )
    return;

  (window as any).store = JSON.parse(event.data);

  if(!(window as any).store.name)
    return;


  (window as any).sender = {
    data: JSON.parse(event.data),
    send: (data) => {
      event.source.postMessage(JSON.stringify(data), event.origin)
    }
  };
}


/*

 window.addEventListener('message', function (event) {
 var domain = "https://" + window.location.host
 console.log(event.origin, window.location.host);
 if (event.origin !== domain) return;
 try {
 let d = JSON.parse(event.data)
 if (d && d.distretti) {
 (window as any).polymetric = {
 data: JSON.parse(event.data),
 send: (data) => {
 event.source.postMessage(JSON.stringify(data), event.origin)
 }
 };
 }
 } catch (e) {

 }
 finally {

 }
 console.log('message received:  ' + event.data, event);
 }, false);
 */
