import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_copy/constants/constants.dart';

class ChatPage extends StatelessWidget {
  final List conversations;

  ChatPage(this.conversations);

  @override
  Widget build(BuildContext context) {
    
    final _theme = Theme.of(context);

    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (bctx, index) => Card(
        margin: _theme.cardTheme.margin,
        child: ListTile(
            leading: Container(
              child: CircleAvatar(maxRadius: 26,),
            ),
            title: Text("Team CWI - Oficial", style: _theme.textTheme.title),
            subtitle: Text(
              "olá",
              style: _theme.textTheme.subtitle,
            ),
            trailing: Column(
              children: <Widget>[
                Text(
                  DateFormat.Hm().format(DateTime.now()).toString(),
                  style: TextStyle(color: _theme.accentColor),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                ),
                CircleAvatar(
                  maxRadius: 14,
                  backgroundColor: Constants.mainColorAccent,
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: _theme.textTheme.caption.color,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
