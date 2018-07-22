import {Component, EventEmitter, HostBinding, Input, OnInit, Output, ViewEncapsulation} from '@angular/core';

@Component({
  encapsulation: ViewEncapsulation.Native,
  selector: 'switch-box',
  templateUrl: './switcher.component.html',
  styleUrls: ['./switcher.component.css']
})
export class SwitcherComponent {

  @Input()
  value: boolean;

  @Output()
  valueChange = new EventEmitter<boolean>();

  currentValue() {
    return this.value;
  }

  @HostBinding('switched') public currentValueFunction = () => {
    return this.value;
  }

}
