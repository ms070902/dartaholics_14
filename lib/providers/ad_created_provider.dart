import 'package:flutter/foundation.dart';

class LocationProvider with ChangeNotifier {
  bool adCreated = false;

  Future<void> changeAdStatus(bool created) async {
    created ? adCreated = true : adCreated = false;
    notifyListeners();
  }
}
