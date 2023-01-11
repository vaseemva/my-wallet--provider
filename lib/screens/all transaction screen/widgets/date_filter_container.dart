import 'package:flutter/material.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/providers/all_transaction_provider.dart';

class DateFilterContainer extends StatelessWidget {
  const DateFilterContainer({
    Key? key,
    required this.dataFilterValue,
    required this.itemDataFilter,
    required this.alltprovider,
  }) : super(key: key);

  final String dataFilterValue;
  final List<String> itemDataFilter;
  final AllTransactionProvider alltprovider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dataFilterValue == 'Monthly' || dataFilterValue == 'Custom'
          ? MediaQuery.of(context).size.width * 0.26
          : MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: appThemeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              alignment: AlignmentDirectional.center,
              iconEnabledColor: Colors.white,
              dropdownColor: appThemeColor,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              borderRadius: BorderRadius.circular(20),
              items:
                  itemDataFilter.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: dataFilterValue,
              onChanged: (String? newValue) {
                alltprovider.dataFilterValue = newValue!;
                alltprovider.monthlydropdownvisiblity =
                    alltprovider.dataFilterValue == 'Monthly';
                alltprovider.customdatevisiblity =
                    alltprovider.dataFilterValue == 'Custom';
              }),
        ),
      ),
    );
  }
}