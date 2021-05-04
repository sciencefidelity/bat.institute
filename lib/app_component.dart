import 'package:angular/angular.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h2>{{title}}</h2>
    <h1>{{hero}}</h1>
  ''',
)
class AppComponent {
  final title = 'Bat Institute';
  var hero = '🦇';
}
