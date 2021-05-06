import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'bat.dart';

@Component(
  selector: 'my-bat',
  template: '''
  <div *ngIf="bat != null">
  <h2>{{bat.name}}</h2>
  <div><label>id: </label>{{bat.id}}</div>
  <div>
    <label>name: </label>
    <input [(ngModel)]="bat.name" placeholder="name">
  </div>
  </div>''',
  directives: [coreDirectives, formDirectives],
)

class BatComponent {
  @Input()
  Bat bat;
}