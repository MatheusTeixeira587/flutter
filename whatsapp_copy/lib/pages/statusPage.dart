import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusPage extends StatelessWidget {
  final List<Map<String, String>> _status;

  StatusPage(this._status);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: CircleAvatar(),
              title: Text(
                "My Status",
                style: _theme.textTheme.title,
              ),
              subtitle: Text("Tap to add status update",
                  style: _theme.textTheme.subtitle),
            ),
          ),
          Container(
            child: Text(
              "Recent updates",
              textAlign: TextAlign.left,
            ),
            color: Color.fromRGBO(214, 214, 214, 0.25),
            padding: EdgeInsets.all(10),
            width: double.infinity,
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _status.length,
            itemBuilder: (bctx, index) => Card(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text(
                  _status.elementAt(index)["name"],
                  style: _theme.textTheme.title,
                ),
                subtitle: Text(
                  "${DateFormat.EEEE().format(DateTime.now()).toString()}, ${DateFormat.Hm().format(DateTime.now()).toString()}",
                  style: _theme.textTheme.subtitle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
