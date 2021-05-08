import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'bat.dart';
import 'bat_service.dart';

@Component(
  selector: 'my-bats',
  templateUrl: 'bat_list_component.html',
  styleUrls: ['bat_list_component.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
)

class BatListComponent implements OnInit {
  final BatService _batService;
  final Router _router;
  List<Bat> bats;
  Bat selected;

  BatListComponent(this._batService, this._router);

  Future<void> _getBats() async {
    bats = await _batService.getAll();
  }

  void ngOnInit() => _getBats();

  void onSelect(Bat bat) => selected = bat;
  
  String _batUrl(int id) => 
    RoutePaths.bat.toUrl(parameters: {idParam: '$id'});
  
  Future<NavigationResult> gotoDetail() => 
    _router.navigate(_batUrl(selected.id));
}
