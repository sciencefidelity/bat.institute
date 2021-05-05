import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/bat.dart';
import 'src/mock_bats.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives, formDirectives],
)

class AppComponent {
  final title = 'Bat Institute';
  List<Bat> bats = mockBats;
  Bat bat = Bat(1, '🥷🏻');
}