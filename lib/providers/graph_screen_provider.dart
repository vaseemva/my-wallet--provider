import 'package:flutter/material.dart';


class GraphProvider with ChangeNotifier {
  String _graphFilterValue = "All";
  String _monthsFilterValue = "January";
  bool _isvisible = false;

  String get graphFilterValue => _graphFilterValue;
  String get monthsFilterValue => _monthsFilterValue;
  bool get isvisible => _isvisible;

  set graphFilterValue(String value) {
    _graphFilterValue = value;
    notifyListeners();
  }

  set monthsFilterValue(String value) {
    _monthsFilterValue = value;
    notifyListeners();
  }

  set isVisible(bool visiblity) {
    _isvisible = visiblity;
    notifyListeners();
  }
}
