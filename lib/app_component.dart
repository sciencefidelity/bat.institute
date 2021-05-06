import 'package:angular/angular.dart';

import 'src/bat.dart';
import 'src/bat_component.dart';
import 'src/mock_bats.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, BatComponent],
)

class AppComponent {
  final title = 'Bat Institute';
  List<Bat> bats = mockBats;
  Bat selected;
  void onSelect(Bat bat) => selected = bat;
}
