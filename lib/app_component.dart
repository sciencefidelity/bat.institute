import 'dart:async';

import 'package:angular/angular.dart';

import 'src/bat.dart';
import 'src/bat_component.dart';
import 'src/bat_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, BatComponent],
  providers: [ClassProvider(BatService)],
)
class AppComponent implements OnInit {
  final title = 'Bat Institute';
  final BatService _batService;
  List<Bat> bats;
  Bat selected;

  AppComponent(this._batService);

  Future<void> _getBats() async {
    bats = await _batService.getAll();
  }

  void ngOnInit() => _getBats();

  void onSelect(Bat bat) => selected = bat;
}
