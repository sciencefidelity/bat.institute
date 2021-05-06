import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/bat.dart';
import 'src/mock_bats.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, formDirectives],
)

class AppComponent {
  final title = 'Bat Institute';
  List<Bat> bats = mockBats;
  Bat selected;
  void onSelect(Bat bat) => selected = bat;
}
