import 'package:flutter/material.dart';

class EditTransactionProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  String _transactionType = 'income';

  DateTime get selectedDate => _selectedDate;
  String get transactionType => _transactionType;

  set selectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  set selectTransactionType(String type) {
    _transactionType = type;
    notifyListeners();
  }
}
