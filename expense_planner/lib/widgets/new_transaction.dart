import 'dart:io';

import 'package:expense_planner/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function handleNewTransaction;

  NewTransaction(this.handleNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate = DateTime.now();

  void _onSubmit() {
    final titleText = _titleController.text;
    final amountText = _amountController.text;

    if (titleText.isEmpty ||
        amountText.isEmpty ||
        double.tryParse(amountText) == null ||
        _pickedDate == null) return;

    widget.handleNewTransaction(
        titleText, double.tryParse(amountText), _pickedDate);

    Navigator.of(context).pop();
  }

  void _renderDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 7)),
        lastDate: DateTime.now(),
        builder: (ctx, child) {
          return Theme(child: child, data: Theme.of(context));
        }).then((picked) {
      if (picked == null) return;

      setState(() {
        _pickedDate = picked;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Text(_pickedDate == null
                          ? "No Date Chosen!"
                          : "Date: " +
                              DateFormat(Constants.dateFormat)
                                  .format(_pickedDate)
                                  .toString()),
                      Platform.isIOS
                          ? CupertinoButton(
                              onPressed: _renderDatePicker,
                              child: Text(
                                "Chose date",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ))
                          : FlatButton(
                              child: Text("Chose date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              onPressed: _renderDatePicker,
                            )
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Add Transaction",
                  ),
                  onPressed: _onSubmit,
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          )),
    );
  }
}
