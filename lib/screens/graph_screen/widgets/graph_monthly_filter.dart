import 'package:flutter/material.dart';
import 'package:my_wallet_app/colors/colors.dart';
import 'package:my_wallet_app/providers/graph_screen_provider.dart';
import 'package:my_wallet_app/screens/graph_screen/widgets/widgets.dart';

class MonthlyFilterContainer extends StatelessWidget {
  const MonthlyFilterContainer({
    Key? key,
    required this.provider,
    required this.monthsFilter,
    required this.monthsFilterValue,
  }) : super(key: key);

  final GraphProvider provider;
  final List<String> monthsFilter;
  final String monthsFilterValue;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: provider.isvisible,
      child: dropDownContainer(
        context,
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                iconEnabledColor: Colors.white,
                menuMaxHeight: 130.0,
                dropdownColor: appThemeColor,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                borderRadius: BorderRadius.circular(10),
                items:
                    monthsFilter.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: monthsFilterValue,
                onChanged: (String? newValue) {
                  provider.monthsFilterValue = newValue!;
                }),
          ),
        ),
      ),
    );
  }
}