import 'dart:async';

import 'bat.dart';
import 'mock_bats.dart';

class BatService {
  Future<List<Bat>> getAll() async => mockBats;
  
  Future<List<Bat>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 2), getAll);
  }
  
  Future<Bat> get(int id) async =>
    (await getAll()).firstWhere((bat) => bat.id == id);
}
