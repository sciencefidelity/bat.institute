import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'bat.dart';

class BatService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _batsUrl = 'api/bats'; // URL to web API
  
  final Client _http;
  
  BatService(this._http);
  
  Future<List<Bat>> getAll() async {
    try {
      final response = await _http.get(_batsUrl);
      final bats = (_extractData(response) as List)
        .map((json) => Bat.fromJson(json))
        .toList();
      return bats;
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];
  
  Exception _handleError(dynamic e) {
    print(e);
    return Exception('Server error; cause: $e');
  }
  
  Future<Bat> get(int id) async {
    try {
      final response = await _http.get('$_batsUrl/$id');
      return Bat.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  Future<Bat> update(Bat bat) async {
    try {
      final url = '$_batsUrl/${bat.id}';
      final response =
        await _http.put(url, headers: _headers, body: json.encode(bat));
      return Bat.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }
}
