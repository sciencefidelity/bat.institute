import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'bat.dart';
import 'bat_component.dart';
import 'bat_service.dart';

@Component(
  selector: 'my-bats',
  templateUrl: 'bat_list_component.html',
  styleUrls: ['bat_list_component.css'],
  directives: [coreDirectives, BatComponent],
  providers: [ClassProvider(BatService)],
)

class BatListComponent implements OnInit {
  final BatService _batService;
  List<Bat> bats;
  Bat selected;

  BatListComponent(this._batService);

  Future<void> _getBats() async {
    bats = await _batService.getAll();
  }

  void ngOnInit() => _getBats();

  void onSelect(Bat bat) => selected = bat;
}
