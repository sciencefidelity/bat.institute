import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bat_institute/app_component.template.dart' as ng;

import 'main.template.dart' as self;

@GenerateInjector(
  // use routerProviders in prodution
  routerProviderHash,
)

final InjectFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
