import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'src/bat.dart';

class InMemoryDataService extends MockClient {
  static final _initialBats = [
    {'id': 11, 'name': '🦇'},
    {'id': 12, 'name': '🦉'},
    {'id': 13, 'name': '🧛🏻'},
    {'id': 14, 'name': '🥷🏻'},
    {'id': 15, 'name': '🕷'},
    {'id': 16, 'name': '🐈‍⬛'},
    {'id': 17, 'name': '🧟‍♀️'},
    {'id': 18, 'name': '👹'},
    {'id': 19, 'name': '👻'},
    {'id': 20, 'name': '🐺'}
  ];
  static List<Bat> _batsDb;
  static int _nextId;
  
  static Future<Response> _handler(Request request) async {
    if (_batsDb == null) resetDb();
    var data;
    switch (request.method) {
      case 'GET':
        final id = int.tryParse(request.url.pathSegments.last);
        if (id != null) {
          data = _batsDb
            .firstWhere((bat) => bat.id == id); //throws if no match
        } else {
          String prefix = request.url.queryParameters['name'] ?? '';
          final regExp = RegExp(prefix, caseSensitive: false);
          data = _batsDb.where((bat) => bat.name.contains(regExp)).toList();
        }
        break;
      case 'POST':
        var name = json.decode(request.body)['name'];
        var newBat = Bat(_nextId++, name);
        _batsDb.add(newBat);
        data = newBat;
        break;
      case 'PUT':
        var batChanges = Bat.fromJson(json.decode(request.body));
        var targetBat = _batsDb.firstWhere((b) => b.id == batChanges.id);
        targetBat.name = batChanges.name;
        data = targetBat;
        break;
      case 'DELETE':
        var id = int.parse(request.url.pathSegments.last);
        _batsDb.removeWhere((bat) => bat.id == id);
        // no data so leave it as null
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }
    return Response(json.encode({'data': data}), 200,
      headers: {'content-type': 'application/json'});
  }
  
  static resetDb() {
    _batsDb = _initialBats.map((json) => Bat.fromJson(json)).toList();
    _nextId = _batsDb.map((bat) => bat.id).fold(0, max) + 1;
  }
  static String lookUpName(int id) =>
    _batsDb.firstWhere((bat) => bat.id == id, orElse: null)?.name;
  
  InMemoryDataService() : super(_handler);
}
