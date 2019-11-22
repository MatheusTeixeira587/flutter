import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_copy/constants/constants.dart';

class CallPage extends StatelessWidget {
  final List<Map<String, String>> calls;

  CallPage(this.calls);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (bctx, index) => Card(
        child: ListTile(
          leading: CircleAvatar(),
          title: Text(calls.elementAt(index)["name"]),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.call_received,
                color: Constants.mainColorAccent,
              ),
              Text(
                "${DateFormat("EEEE  dd, hh:mm").format(DateTime.now()).toString()}",
                style: _theme.textTheme.subtitle,
              ),
            ],
          ),
          trailing: Icon(
            Icons.call,
            color: Constants.mainColorLight,
          ),
        ),
      ),
    );
  }
}
