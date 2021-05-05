import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'bat.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h2>{{title}}</h2>
    <h1>{{bat.name}}</h1>
    <div><label>id: </label>{{bat.id}}</div>
    <div>
      <label>name: </label>
      <input [(ngModel)]="bat.name" placeholder="name">
    </div>
  ''',
  directives: [formDirectives],
)
class AppComponent {
  final title = 'Bat Institute';
  Bat bat = Bat(1, '🥷🏻');
}
