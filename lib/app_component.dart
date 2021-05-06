import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/bat_list_component.dart';
import 'src/bat_service.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <my-bats></my-bats>
  ''',
  directives: [BatListComponent],
  providers: [ClassProvider(BatService)],
)

class AppComponent {
  final title = 'Bat Institute';
}
