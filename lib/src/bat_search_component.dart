import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'bat.dart';
import 'bat_search_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'bat-search',
  templateUrl: 'bat_search_component.html',
  styleUrls: ['bat_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(BatSearchService)],
  pipes: [commonPipes],
)
class BatSearchComponent implements OnInit {
  final BatSearchService _batSearchService;
  final Router _router;

  Stream<List<Bat>> bats;
  final StreamController<String> _searchTerms =
      StreamController<String>.broadcast();

  BatSearchComponent(this._batSearchService, this._router);

  void search(String term) => _searchTerms.add(term);

  @override
  void ngOnInit() async {
    bats = _searchTerms.stream
        .debounce(Duration(milliseconds: 300))
        .distinct()
        .switchMap((term) => term.isEmpty
            ? Stream<List<Bat>>.fromIterable([<Bat>[]])
            : _batSearchService.search(term).asStream())
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }

  String _batUrl(int id) => RoutePaths.bat.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail(Bat bat) =>
      _router.navigate(_batUrl(bat.id));
}
