import 'package:expense_planner/constants/constants.dart';
import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function handleRemoveTransaction;

  TransactionList(this.transactions, this.handleRemoveTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transactions added yet!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Image.asset(
                  Resources.waiting,
                  fit: BoxFit.cover,
                  height: 200,
                ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: ((context, index) => Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text(
                          "\$${transactions.elementAt(index).amount}",
                          style: Theme.of(context).textTheme.title,
                        )),
                      ),
                      title: Text(
                        transactions.elementAt(index).title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(DateFormat(Constants.dateFormat)
                          .format(transactions.elementAt(index).date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => handleRemoveTransaction(transactions.elementAt(index).id),
                      ),
                    ),
                  ))),
    );
  }
}
