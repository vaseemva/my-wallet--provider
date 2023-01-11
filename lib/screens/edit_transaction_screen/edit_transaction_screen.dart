import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/controllers/db_helper.dart';
import 'package:my_wallet_app/providers/edit_screen_provider.dart';
import 'package:my_wallet_app/screens/edit_transaction_screen/widgets.dart';
import 'package:my_wallet_app/screens/home%20screens/home_screen.dart';
import 'package:provider/provider.dart';

class EditTransaction extends StatelessWidget {
  EditTransaction(
      {super.key, required this.index, this.note, this.fieldamount});
  final int index;
  int? fieldamount;
  String? note;

  List<String> months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  TextEditingController editAmountController = TextEditingController();

  TextEditingController editNoteController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate =
        Provider.of<EditTransactionProvider>(context, listen: false)
            .selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 12),
        lastDate: DateTime(2200, 12));
    if (picked != null && picked != selectedDate) {
      // ignore: use_build_context_synchronously
      Provider.of<EditTransactionProvider>(context, listen: false)
          .selectedDate = picked;
    }
  }

  int? amount;

  @override
  Widget build(BuildContext context) {
    editAmountController.text = fieldamount.toString();
    editNoteController.text = note!;
    final provider = Provider.of<EditTransactionProvider>(context);
    String type = provider.transactionType;
    DateTime selectedDate = provider.selectedDate;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appThemeColor,
        title: const Text(
          'Edit Transaction',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(
            height: 13.0,
          ),
          Row(
            children: [
              sympolContainer(Icons.notes),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: TextFormField(
                  controller: editNoteController,
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                      counterText: ""),
                  style: const TextStyle(fontSize: 16.0),
                  onChanged: (value) {
                    note = value;
                  },
                  maxLength: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              sympolContainer(Icons.currency_rupee),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: TextFormField(
                  controller: editAmountController,
                  onChanged: (value) {
                    
                    if (editAmountController.text.isNotEmpty) {
                      
                      amount = int.parse(value);
                      // use the number
                    }else{
                      amount=0;
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: '0', border: InputBorder.none, counterText: ""),
                  style: const TextStyle(fontSize: 20.0),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              sympolContainer(Icons.category),
              const SizedBox(
                width: 15.0,
              ),
              ChoiceChip(
                label: Text(
                  'Income',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: type == "income" ? Colors.white : Colors.black),
                ),
                selected: type == "income" ? true : false,
                selectedColor: appThemeColor,
                onSelected: (value) {
                  provider.selectTransactionType = "income";
                },
              ),
              const SizedBox(
                width: 15.0,
              ),
              ChoiceChip(
                label: Text(
                  'Expense',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: type == "expense" ? Colors.white : Colors.black),
                ),
                selected: type == "expense" ? true : false,
                selectedColor: appThemeColor,
                onSelected: (value) {
                  provider.selectTransactionType = "expense";
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
              onPressed: () {
                selectDate(context);
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
              child: Row(
                children: [
                  sympolContainer(Icons.calendar_month_outlined),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "${selectedDate.day}  ${months[selectedDate.month - 1]}  ${selectedDate.year}",
                    style: const TextStyle(
                        fontSize: 15.0,
                        color: Color.fromRGBO(100, 100, 100, 1)),
                  ),
                ],
              )),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
                onPressed: () {
                  updateTransaction(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: appThemeColor,
                    textStyle: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w400)),
                child: const Text('Update')),
          ),
        ],
      ),
    );
  }

  updateTransaction(BuildContext context) {
    DateTime selectedDate =
        Provider.of<EditTransactionProvider>(context, listen: false)
            .selectedDate;
    String type = Provider.of<EditTransactionProvider>(context, listen: false)
        .transactionType;
    if (amount != 0 && note != '' && type.isNotEmpty) { 
      Dbhelper dbhelper = Dbhelper();
      dbhelper.updateData(
          amount,
          selectedDate,
          note!,
          type,
          '${selectedDate.day} ${months[selectedDate.month - 1]}  ${selectedDate.year}',
          index);

      AnimatedSnackBar.material('Updated Successfully',
              mobileSnackBarPosition: MobileSnackBarPosition.bottom,
              duration: const Duration(seconds: 3),
              type: AnimatedSnackBarType.success)
          .show(context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      AnimatedSnackBar.material('Please fill all details',
              duration: const Duration(seconds: 3),
              type: AnimatedSnackBarType.error)
          .show(context);
    }
  }
}
