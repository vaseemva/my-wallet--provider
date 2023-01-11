import 'package:flutter/material.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/providers/all_transaction_provider.dart';

class MonthlyDropdown extends StatelessWidget {
  const MonthlyDropdown({
    Key? key,
    required this.monthlydropdownvisiblity,
    required this.dataFilterValue,
    required this.itemsYearFilter,
    required this.yearFilterValue,
    required this.alltprovider,
  }) : super(key: key);

  final bool monthlydropdownvisiblity;
  final String dataFilterValue;
  final List<String> itemsYearFilter;
  final String yearFilterValue;
  final AllTransactionProvider alltprovider;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: monthlydropdownvisiblity,
      child: Row(
        children: [
          const SizedBox(width: 8),
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                color: dataFilterValue == 'Monthly'
                    ? appThemeColor
                    : const Color.fromARGB(255, 201, 245, 235),
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    alignment: AlignmentDirectional.center,
                    disabledHint: const Text('Month'),
                    menuMaxHeight: 200,
                    iconEnabledColor: Colors.white,
                    dropdownColor: appThemeColor,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    borderRadius: BorderRadius.circular(10),
                    items: dataFilterValue == 'Monthly'
                        ? itemsYearFilter
                            .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()
                        : null,
                    value: yearFilterValue,
                    onChanged: (String? newValue) {
                      alltprovider.yearFilterValue = newValue!;
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
