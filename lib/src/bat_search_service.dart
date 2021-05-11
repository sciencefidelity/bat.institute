import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'bat.dart';

class BatSearchService {
  final Client _http;
  
  BatSearchService(this._http);
  
  Future<List<Bat>> Search(String term) async {
    try {
      final response = await _http.get('app/bats/?name=$term');
      return (_extractData(response) as List)
        .map((json) => Bat.fromJson(json))
        .toList;
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  dynamic _extractData(resp) =>json.decode(resp.body)['data'];
  
  Exception _handleError(dynamic e) {
    print(e); // for demo puroses only
    return Exception('Server error; cause: $e');
  }
}
