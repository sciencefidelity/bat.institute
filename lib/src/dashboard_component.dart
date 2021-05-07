import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'bat.dart';
import 'bat_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives, routerDirectives],
)
class DashboardComponent implements OnInit {
  List<Bat> bats;
  
  final BatService _batService;
  
  DashboardComponent(this._batService);
  
  @override
  void ngOnInit() async {
    bats = (await _batService.getAll()).skip(1).take(4).toList();
  }
}