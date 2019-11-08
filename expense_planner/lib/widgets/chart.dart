import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get _grouppedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = recentTransactions
          .where((t) =>
              t.date.day == weekDay.day &&
              t.date.month == weekDay.month &&
              t.date.year == t.date.year)
          .fold(0, (previous, current) => previous + current.amount);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    }).reversed.toList();
  }

  double get _totalSpending => _grouppedTransactionValues.fold(
      0, (previous, current) => previous + current["amount"]);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all((20)),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _grouppedTransactionValues
              .map((t) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        t["day"],
                        t["amount"],
                        _totalSpending == 0.0
                            ? 0.0
                            : ((t["amount"] as double) / _totalSpending)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
