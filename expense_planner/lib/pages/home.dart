import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  bool _showChart = false;

  List<Transaction> get _recentTransactions => _transactions
      .where((t) => t.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
      .toList();

  void _removeTransaction(String id) =>
      setState(() => _transactions.removeWhere((t) => t.id == id));

  void _addNewTransaction(String title, double amount, DateTime date) {
    final tx = Transaction(
        title: title,
        amount: amount,
        date: date,
        id: DateTime.now().toString());

    setState(() => _transactions.add(tx));
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, builder: (_) => NewTransaction(_addNewTransaction));
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final AppBar appBar = AppBar(
      title: Text("Personal expenses"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );

    final Function getAvailableHeight = (BuildContext ctx) =>
        MediaQuery.of(ctx).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final Widget _transactionList = Container(
        height: getAvailableHeight(context) * 0.7,
        child: TransactionList(_transactions, _removeTransaction));

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (!isPortrait)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (value) => setState(() => _showChart = value),
                  )
                ],
              ),
            if (isPortrait)
              Container(
                  height: getAvailableHeight(context) * 0.3,
                  child: Chart(_recentTransactions)),
            if (isPortrait) _transactionList,
            if (!isPortrait)
              _showChart
                  ? Container(
                      height: getAvailableHeight(context) * 0.8,
                      child: Chart(_recentTransactions))
                  : _transactionList
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
