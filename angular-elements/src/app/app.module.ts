import {BrowserModule} from '@angular/platform-browser';
import {CUSTOM_ELEMENTS_SCHEMA, Injector, NgModule} from '@angular/core';

import {AppComponent} from './app.component';
import {SwitcherComponent} from './switcher/switcher.component';
import {createCustomElement} from '@angular/elements';

@NgModule({
  declarations: [
    AppComponent, SwitcherComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  entryComponents: [SwitcherComponent]
})
export class AppModule {
  constructor(private injector: Injector) {
    const customElement = createCustomElement(SwitcherComponent, {injector});
    customElements.define('switch-box', customElement);
  }

  ngDoBootstrap() {
  }
}
