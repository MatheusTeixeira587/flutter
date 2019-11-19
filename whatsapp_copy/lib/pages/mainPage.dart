import 'package:flutter/material.dart';
import 'package:whatsapp_copy/constants/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Constants.appName),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: null,
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(text: "CALLS")
            ],
          ),
        ),
      ),
    );
  }
}
