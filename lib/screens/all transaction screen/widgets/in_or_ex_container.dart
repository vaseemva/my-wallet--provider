import 'package:flutter/material.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/providers/all_transaction_provider.dart';

class InOrExFilterContainer extends StatelessWidget {
  const InOrExFilterContainer({
    Key? key,
    required this.dataFilterValue,
    required this.types,
    required this.dropDownValue,
    required this.alltprovider,
  }) : super(key: key);

  final String dataFilterValue;
  final List<String> types;
  final String dropDownValue;
  final AllTransactionProvider alltprovider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dataFilterValue == 'Monthly' || dataFilterValue == 'Custom'
          ? MediaQuery.of(context).size.width * 0.26
          : MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
          color: appThemeColor, borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              alignment: AlignmentDirectional.center,
              iconEnabledColor: Colors.white,
              dropdownColor: appThemeColor,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              items: types.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: dropDownValue,
              onChanged: (String? newvalue) {
                alltprovider.dropDownValue = newvalue!;
              }),
        ),
      ),
    );
  }
}