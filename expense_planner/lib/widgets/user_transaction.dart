import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "qwey", title: "shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "oqwu", title: "shirt", amount: 29.99, date: DateTime.now()),
    Transaction(
        id: "zxbz", title: "lunch", amount: 10.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final tx = Transaction(title: title, amount: amount, date: DateTime.now(), id: DateTime.now().toString());
    setState(() {
     _transactions.add(tx); 
    });
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}