  import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bat_institute/app_component.template.dart' as ng;
import 'package:bat_institute/in_memory_data_service.dart';
import 'package:http/http.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  // use routerProviders in prodution
  routerProvidersHash,
  ClassProvider(Client, useClass: InMemoryDataService),
  // Using a real back end?
  // Import 'package:http/browser_client.dart' and change the above to:
  // ClassProvider(Client, useClass: BrowserClient),
])

final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
