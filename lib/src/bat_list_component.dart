import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'bat.dart';
import 'bat_component.dart';
import 'bat_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-bats',
  templateUrl: 'bat_list_component.html',
  styleUrls: ['bat_list_component.css'],
  directives: [coreDirectives, BatComponent],
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

  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    bats.add(await _batService.create(name));
    selected = null;
  }

  Future<void> delete(Bat bat) async {
    await _batService.delete(bat.id);
    bats.remove(bat);
    if (selected == bat) selected = null;
  }

  void onAdd(String name) {
    add(name);
    name = '';
  }

  void onDelete(event) {
    delete(event);
    event.stopPropagation();
  }

  @override
  void ngOnInit() => _getBats();

  void onSelect(Bat bat) => selected = bat;

  String _batUrl(int id) => RoutePaths.bat.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_batUrl(selected.id));
}

// (click)="add(batName.value); batName.value=''"
// (click)="delete(bat); $event.stopPropagation()"
