import 'dart:async';

import 'bat.dart';
import 'mock_bats.dart';

class BatService {
  Future<List<Bat>> getAll() async => mockBats;
  // See the "Take it slow" appendix
  Future<List<Bat>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 2), getAll);
  }
}
