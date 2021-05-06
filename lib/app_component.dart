import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/bat_list_component.dart';
import 'src/bat_service.dart';

@Component(
  selector: 'my-app',
  template: '''
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  directives: [routerDirectives],
  providers: [ClassProvider(BatService)],
  exports: [RoutePaths, Routes],
)

class AppComponent {
  final title = 'Bat Institute';
}
