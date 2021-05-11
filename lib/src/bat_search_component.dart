import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'route_paths.dart';
import 'bat_search_service.dart';
import 'bat.dart';

@Component(
  selector: 'bat-search',
  templateUrl: 'bat_search_component.html',
  styleUrls: ['bat_search_component.css'],
  directies: [coreDirectives],
  providers: [ClassProvider(BatSearchService)],
  pipes: [commonPipes],
)
class BatSearchComponent implements OnInit {
  BatSearchService _batSearchService;
  Router _router;
  
  Stream<List<Bat>> bats;
  StreamController<String> _SearchTerms = StreamController<String>.broadcast();
  
  BatSearchComponent(this._batSearchService, this._router) {}
  
  void search(String term) => _searchTerms.add(term);
  
  void ngOnInit() async {
    bats = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
          ? Stream<List<Bat>>.fromIterable([<Bat>[]])
          : _batSearchService.search(term).asStream()))
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }
  
  String _batUrl(int id) =>
    RoutePaths.bat.toUrl(parameters: {idParam: '$id');
  
  Future<NavigationResult> gotoDetail(Bat bat) =>
    _router.navigate(_batUrl(bat.id));
}
