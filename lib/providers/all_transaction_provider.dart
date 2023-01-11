import 'package:flutter/material.dart';

class AllTransactionProvider with ChangeNotifier {
DateTimeRange _dateRange =
    DateTimeRange(start: DateTime.now(), end: DateTime.now());

  bool _monthlydropdownvisiblity = false;
  bool _customdatevisiblity = false;
  String _dataFilterValue = 'All';
  String _yearFilterValue = 'JAN';
  String _dropDownValue = 'All';

  bool get monthlydropdownvisiblity => _monthlydropdownvisiblity;
  bool get customdatevisiblity => _customdatevisiblity;
  String get dataFilterValue=> _dataFilterValue;
  String  get yearFilterValue=>_yearFilterValue;
  String get dropDownValue =>_dropDownValue;
  DateTimeRange get dateRange=>_dateRange;
  
  set monthlydropdownvisiblity(bool visiblity) {
    _monthlydropdownvisiblity = visiblity;
    notifyListeners();
  }

  set dateRange(DateTimeRange drange) {
    _dateRange = drange;
    notifyListeners();
  }

   set customdatevisiblity(bool visiblity) {
    _customdatevisiblity = visiblity;
    notifyListeners();
  }
   set dataFilterValue(String value) {
    _dataFilterValue = value;
    notifyListeners();
  }
  set yearFilterValue(String value) {
    _yearFilterValue = value;
    notifyListeners();
  }
   set dropDownValue(String value) {
    _dropDownValue = value;
    notifyListeners();
  }
  
}
