import 'dart:async';

import 'bat.dart';
import 'mock_bats.dart';

class BatService {
  Future<List<<Bat>> getAll() async => mockBats;
}
