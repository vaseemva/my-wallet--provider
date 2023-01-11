import 'package:flutter/material.dart';
import 'package:my_wallet_app/models/transaction_model.dart';
import 'package:my_wallet_app/providers/all_transaction_provider.dart';
import 'package:provider/provider.dart';
import 'widgets.dart';

class AllTransactionWidget extends StatelessWidget {
  final List<TransactionModel> data;
 const AllTransactionWidget({super.key, required this.data});

 

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AllTransactionProvider>(context);
     final DateTime defaultDate = DateTime.now();
  final startDate =provider.dateRange.start;
  final endDate =provider.dateRange.end;
    return ListView.builder(
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          TransactionModel dataAtIndex = data[index];
          //filters for income
          if (provider.dropDownValue == 'Income' && dataAtIndex.type == 'income') {
            if (provider.dataFilterValue == 'Today') {
              if (dataAtIndex.dateTime.month == defaultDate.month &&
                  dataAtIndex.dateTime.day == defaultDate.day) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              }
              //Custom
            } else if (provider.dataFilterValue == 'Custom') {
              if (dataAtIndex.dateTime.isAfter(startDate) &&
                  dataAtIndex.dateTime.isBefore(endDate)) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              }
              //all
            } else if (provider.dataFilterValue == 'All') {
              return allTransactionIncomeTile(
                  dataAtIndex.amount,
                  dataAtIndex.note,
                  dataAtIndex.date,
                  index,
                  dataAtIndex.type,
                  dataAtIndex.dateTime);
            } else if (provider.dataFilterValue == 'Monthly') {
              //Monthly
              if (provider.yearFilterValue == 'JAN' && dataAtIndex.dateTime.month == 1) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'FEB' &&
                  dataAtIndex.dateTime.month == 2) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'MAR' &&
                  dataAtIndex.dateTime.month == 3) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'APR' &&
                  dataAtIndex.dateTime.month == 4) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'MAY' &&
                  dataAtIndex.dateTime.month == 5) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'JUN' &&
                  dataAtIndex.dateTime.month == 6) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'JUL' &&
                  dataAtIndex.dateTime.month == 7) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'AUG' &&
                  dataAtIndex.dateTime.month == 8) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'SEP' &&
                  dataAtIndex.dateTime.month == 9) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'OCT' &&
                  dataAtIndex.dateTime.month == 10) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'NOV' &&
                  dataAtIndex.dateTime.month == 11) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'DEC' &&
                  dataAtIndex.dateTime.month == 12) {
                return allTransactionIncomeTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              }
            }
          } else if (provider.dropDownValue == 'Expense' &&
              dataAtIndex.type == 'expense') {
            /////Expense Filtration

            if (provider.dataFilterValue == 'All') {
              return allTransactionExpenseTile(
                  dataAtIndex.amount,
                  dataAtIndex.note,
                  dataAtIndex.date,
                  index,
                  dataAtIndex.type,
                  dataAtIndex.dateTime);
            } else if (provider.dataFilterValue == 'Today') {
              if (dataAtIndex.dateTime.month == defaultDate.month &&
                  dataAtIndex.dateTime.day == defaultDate.day) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              }
            } else if (provider.dataFilterValue == 'Custom') {
              if (dataAtIndex.dateTime.isAfter(startDate) &&
                  dataAtIndex.dateTime.isBefore(endDate)) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              }
            } else if (provider.dataFilterValue == 'Monthly') {
              //Monthly
              if (provider.yearFilterValue == 'JAN' && dataAtIndex.dateTime.month == 1) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'FEB' &&
                  dataAtIndex.dateTime.month == 2) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'MAR' &&
                  dataAtIndex.dateTime.month == 3) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'APR' &&
                  dataAtIndex.dateTime.month == 4) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'MAY' &&
                  dataAtIndex.dateTime.month == 5) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'JUN' &&
                  dataAtIndex.dateTime.month == 6) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'JUL' &&
                  dataAtIndex.dateTime.month == 7) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'AUG' &&
                  dataAtIndex.dateTime.month == 8) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'SEP' &&
                  dataAtIndex.dateTime.month == 9) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'OCT' &&
                  dataAtIndex.dateTime.month == 10) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'NOV' &&
                  dataAtIndex.dateTime.month == 11) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              } else if (provider.yearFilterValue == 'DEC' &&
                  dataAtIndex.dateTime.month == 12) {
                return allTransactionExpenseTile(
                    dataAtIndex.amount,
                    dataAtIndex.note,
                    dataAtIndex.date,
                    index,
                    dataAtIndex.type,
                    dataAtIndex.dateTime);
              }
            }
          } else {
            if (provider.dropDownValue == 'All') {
              if (dataAtIndex.type == 'income') {
                if (provider.dataFilterValue == 'All') {
                  return allTransactionIncomeTile(
                      dataAtIndex.amount,
                      dataAtIndex.note,
                      dataAtIndex.date,
                      index,
                      dataAtIndex.type,
                      dataAtIndex.dateTime);
                } else if (provider.dataFilterValue == 'Today') {
                  if (dataAtIndex.dateTime.month == defaultDate.month &&
                      dataAtIndex.dateTime.day == defaultDate.day) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  }
                } else if (provider.dataFilterValue == 'Custom') {
                  if (dataAtIndex.dateTime.isAfter(startDate) &&
                      dataAtIndex.dateTime.isBefore(endDate)) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  }
                } else if (provider.dataFilterValue == 'Monthly') {
                  if (provider.yearFilterValue == 'JAN' &&
                      dataAtIndex.dateTime.month == 1) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'FEB' &&
                      dataAtIndex.dateTime.month == 2) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'MAR' &&
                      dataAtIndex.dateTime.month == 3) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'APR' &&
                      dataAtIndex.dateTime.month == 4) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'MAY' &&
                      dataAtIndex.dateTime.month == 5) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'JUN' &&
                      dataAtIndex.dateTime.month == 6) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'JUL' &&
                      dataAtIndex.dateTime.month == 7) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'AUG' &&
                      dataAtIndex.dateTime.month == 8) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'SEP' &&
                      dataAtIndex.dateTime.month == 9) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'OCT' &&
                      dataAtIndex.dateTime.month == 10) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'NOV' &&
                      dataAtIndex.dateTime.month == 11) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'DEC' &&
                      dataAtIndex.dateTime.month == 12) {
                    return allTransactionIncomeTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  }
                }
              } else {
                if (provider.dataFilterValue == 'All') {
                  return allTransactionExpenseTile(
                      dataAtIndex.amount,
                      dataAtIndex.note,
                      dataAtIndex.date,
                      index,
                      dataAtIndex.type,
                      dataAtIndex.dateTime);
                } else if (provider.dataFilterValue == 'Today') {
                  if (dataAtIndex.dateTime.month == defaultDate.month &&
                      dataAtIndex.dateTime.day == defaultDate.day) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  }
                } else if (provider.dataFilterValue == 'Custom') {
                  if (dataAtIndex.dateTime.isAfter(startDate) &&
                      dataAtIndex.dateTime.isBefore(endDate)) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  }
                } else if (provider.dataFilterValue == 'Monthly') {
                  if (provider.yearFilterValue == 'JAN' &&
                      dataAtIndex.dateTime.month == 1) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'FEB' &&
                      dataAtIndex.dateTime.month == 2) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'MAR' &&
                      dataAtIndex.dateTime.month == 3) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'APR' &&
                      dataAtIndex.dateTime.month == 4) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'MAY' &&
                      dataAtIndex.dateTime.month == 5) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'JUN' &&
                      dataAtIndex.dateTime.month == 6) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'JUL' &&
                      dataAtIndex.dateTime.month == 7) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'AUG' &&
                      dataAtIndex.dateTime.month == 8) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'SEP' &&
                      dataAtIndex.dateTime.month == 9) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'OCT' &&
                      dataAtIndex.dateTime.month == 10) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'NOV' &&
                      dataAtIndex.dateTime.month == 11) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  } else if (provider.yearFilterValue == 'DEC' &&
                      dataAtIndex.dateTime.month == 12) {
                    return allTransactionExpenseTile(
                        dataAtIndex.amount,
                        dataAtIndex.note,
                        dataAtIndex.date,
                        index,
                        dataAtIndex.type,
                        dataAtIndex.dateTime);
                  }
                }
              }
            }
          }
          return const SizedBox();
        });
  }
}
