import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'bat_list_component.template.dart' as bat_list_template;

export 'route_paths.dart';

class Routes {
  static final bats = RouteDefinition(
    routePath: RoutePaths.bats,
    component: bat_list_template.BatListComponentNgFactory,
  );
  
  static final all = <RouteDefinition>[
    bats,
  ];
}