import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart({this.transactions});

  List<Map<String, Object>> get getChartValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var txn in transactions) {
        if (txn.date.day == weekday.day &&
            txn.date.month == weekday.month &&
            txn.date.year == weekday.year) {
          totalSum += txn.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get getTotalSpending {
    return getChartValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getChartValues.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                day: tx['day'],
                amount: tx['amount'],
                spendPercent: getTotalSpending == 0.0
                    ? 0.0
                    : (tx['amount'] as double) / getTotalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
