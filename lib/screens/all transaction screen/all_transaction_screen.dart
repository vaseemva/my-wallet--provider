import 'package:flutter/material.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/controllers/db_helper.dart';
import 'package:my_wallet_app/models/transaction_model.dart';
import 'package:my_wallet_app/providers/all_transaction_provider.dart';
import 'package:my_wallet_app/screens/all%20transaction%20screen/widgets/all_transaction_widget.dart';
import 'package:my_wallet_app/screens/all%20transaction%20screen/widgets/date_filter_container.dart';
import 'package:my_wallet_app/screens/all%20transaction%20screen/widgets/in_or_ex_container.dart';
import 'package:my_wallet_app/screens/all%20transaction%20screen/widgets/monthly_dropdown.dart';
import 'package:my_wallet_app/screens/all%20transaction%20screen/widgets/widgets.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class AllTransactionScreen extends StatelessWidget {
  AllTransactionScreen({super.key});
  DateTimeRange initdateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: initdateRange,
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (newDateRange == null) return; 

    // ignore: use_build_context_synchronously
    Provider.of<AllTransactionProvider>(context, listen: false).dateRange =
        newDateRange;
  }

  final types = <String>[
    'All',
    'Income',
    'Expense',
  ];

  final itemDataFilter = <String>[
    'All',
    'Today',
    'Monthly',
    'Custom',
  ];

  final itemsYearFilter = <String>[
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  Dbhelper dbhelper = Dbhelper();

  @override
  Widget build(BuildContext context) {
    final alltprovider = Provider.of<AllTransactionProvider>(context);
    bool monthlydropdownvisiblity = alltprovider.monthlydropdownvisiblity;
    bool customdatevisiblity = alltprovider.customdatevisiblity;
    String dataFilterValue = alltprovider.dataFilterValue;
    String yearFilterValue = alltprovider.yearFilterValue;
    String dropDownValue = alltprovider.dropDownValue;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('All Transactions',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InOrExFilterContainer(
                        dataFilterValue: dataFilterValue,
                        types: types,
                        dropDownValue: dropDownValue,
                        alltprovider: alltprovider),
                    dataFilterValue == 'Monthly' || dataFilterValue == 'Custom'
                        ? const SizedBox(width: 7)
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15),
                    DateFilterContainer(
                        dataFilterValue: dataFilterValue,
                        itemDataFilter: itemDataFilter,
                        alltprovider: alltprovider),
                    MonthlyDropdown(
                        monthlydropdownvisiblity: monthlydropdownvisiblity,
                        dataFilterValue: dataFilterValue,
                        itemsYearFilter: itemsYearFilter,
                        yearFilterValue: yearFilterValue,
                        alltprovider: alltprovider),
                    Visibility(
                      visible: customdatevisiblity,
                      child: IconButton(
                          padding: const EdgeInsets.only(bottom: 0),
                          onPressed: () {
                            pickDateRange(context);
                          },
                          color: appThemeColor,
                          icon: Icon(
                            Icons.date_range,
                            size: MediaQuery.of(context).size.height * 0.06,
                          )),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<TransactionModel>>(
                future: dbhelper.fetchSavedData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text("Unexpected Error Occured !!"));
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(child: noDataCard());
                    }
                    return AllTransactionWidget(data: snapshot.data!);
                  }
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }
}

