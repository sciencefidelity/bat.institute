import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'bat.dart';
import 'bat_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-bat',
  templateUrl: 'bat_component.html',
  directives: [coreDirectives, formDirectives],
)

class BatComponent implements OnActivate {
  Bat bat;
  final BatService _batService;
  final Location _location;
  
  BatComponent(this._batService, this._location);
  
  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) bat = await (_batService.get(id));
  }
  
  void goBack() => _location.back();
}
