import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/transaction_model.dart';

class Dbhelper with ChangeNotifier {
  late Box box;
  late SharedPreferences preferences;

  Dbhelper() {
    openBox();
  }

  openBox() {
    box = Hive.box('transactions');
  }

  Future addData(
      int amount, String date, String note, String type, DateTime data) async {
    var value = {
      'amount': amount,
      'date': date,
      'note': note,
      'type': type,
      'dateTime': data
    };
    box.add(value);
    notifyListeners();
  }

  addname(String name) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name.trim());
    notifyListeners();
  }

 Future<String?> getname() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString("name");
  }

  Future<List<TransactionModel>> fetchSavedData() async {
    
    if (box.values.isEmpty) {
      return Future.value([]);
    } else {
      List<TransactionModel> items = [];
      box.toMap().values.forEach((element) {
        items.add(TransactionModel(
            element['amount'] as int,
            element['dateTime'] as DateTime,
            element['type'],
            element['note'],
            element['date']));
      });
      return items;
    }
  }

  Future deleteData(int index) async {
    final box = Hive.box('transactions');
    await box.deleteAt(index);
    notifyListeners();
  }

  Future updateData(int? amount, DateTime data, String note, String type,
      String date, index) async {
    final box = Hive.box('transactions');
    var value = {
      'amount': amount,
      'date': date,
      'note': note,
      'type': type,
      'dateTime': data
    };
    box.putAt(index, value);
    notifyListeners();
  }

  resetData() {
    final box = Hive.box('transactions');
    box.clear();
    notifyListeners();
  }

  resetSharedPreference() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.clear();
    notifyListeners();
  }
}
