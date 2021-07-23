import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/bat_service.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="RoutePaths.dashboard.toUrl()"
         [routerLinkActive]="'active'">Dash</a>
      <a [routerLink]="RoutePaths.bats.toUrl()"
         [routerLinkActive]="'active'">Bats</a>
    </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(BatService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Bat Institute';
}
