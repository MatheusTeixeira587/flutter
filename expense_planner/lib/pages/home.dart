import 'dart:io';
import 'package:expense_planner/constants/constants.dart';
import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
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

  void _startAddNewTransaction(BuildContext ctx) => showModalBottomSheet(
      context: ctx, builder: (_) => NewTransaction(_addNewTransaction));

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final AppBar appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(Constants.appTitle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text(Constants.appTitle),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );

    final getAvailableHeight = (BuildContext ctx) =>
        MediaQuery.of(ctx).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final _transactionList = Container(
        height: getAvailableHeight(context) * 0.7,
        child: TransactionList(_transactions, _removeTransaction));

    final _body = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (isPortrait)
            Container(
                height: getAvailableHeight(context) * 0.3,
                child: Chart(_recentTransactions)),
          if (isPortrait) _transactionList,
          if (!isPortrait)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Show Chart"),
                Switch.adaptive(
                  activeColor: Theme.of(context).accentColor,
                  value: _showChart,
                  onChanged: (value) => setState(() => _showChart = value),
                )
              ],
            ),
          if (!isPortrait)
            _showChart
                ? Container(
                    height: getAvailableHeight(context) * 0.8,
                    child: Chart(_recentTransactions))
                : _transactionList
        ],
      ),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _body,
          )
        : Scaffold(
            appBar: appBar,
            body: _body,
            floatingActionButton: Platform.isIOS
                ? null
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
  }
}
