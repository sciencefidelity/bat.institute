import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'dashboard_component.template.dart' as dashboard_template;
import 'bat_component.template.dart' as bat_component;
import 'bat_list_component.template.dart' as bat_list_template;

export 'route_paths.dart';

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );
  static final bat = RouteDefinition(
    routePath: RoutePaths.hero,
    component: bat_template.BatComponentNgFactory,
    );
  static final bats = RouteDefinition(
    routePath: RoutePaths.bats,
    component: bat_list_template.BatListComponentNgFactory,
  );
  
  static final all = <RouteDefinition>[
    dashboard,
    bat,
    bats,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
