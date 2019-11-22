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

  Widget _buildCupertinoAppBar() => CupertinoNavigationBar(
        middle: const Text(Constants.appTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: const Icon(CupertinoIcons.add),
              onTap: () => _startAddNewTransaction(context),
            )
          ],
        ),
      );

  Widget _buildMaterialAppBar() => AppBar(
        title: const Text(Constants.appTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      );

  Widget _buildBody(
          double avalaibleHeight, bool isPortrait, Widget transactionList) =>
      SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ..._buildPortraitBody(avalaibleHeight, transactionList),
            ..._buildLandscapeBody(avalaibleHeight),
          ],
        ),
      ));

  List<Widget> _buildPortraitBody(
          double avalaibleHeight, Widget transactionList) =>
      [
        Container(
            height: avalaibleHeight * 0.3, child: Chart(_recentTransactions)),
        transactionList
      ];

  List<Widget> _buildLandscapeBody(double availableHeight) => [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Show Chart"),
            Switch.adaptive(
              activeColor: Theme.of(context).accentColor,
              value: _showChart,
              onChanged: (value) => setState(() => _showChart = value),
            )
          ],
        ),
        _showChart
            ? Container(
                height: availableHeight * 0.8,
                child: Chart(_recentTransactions))
            : _transactions
      ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    final AppBar appBar =
        Platform.isIOS ? _buildCupertinoAppBar() : _buildMaterialAppBar();

    final getAvailableHeight = (BuildContext ctx) =>
        mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final _transactionList = Container(
        height: getAvailableHeight(context) * 0.7,
        child: TransactionList(_transactions, _removeTransaction));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _buildBody(
                getAvailableHeight(context), isPortrait, _transactionList),
          )
        : Scaffold(
            appBar: appBar,
            body: _buildBody(
                getAvailableHeight(context), isPortrait, _transactionList),
            floatingActionButton: Platform.isIOS
                ? null
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
  }
}
