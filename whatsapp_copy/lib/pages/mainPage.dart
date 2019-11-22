import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_copy/constants/constants.dart';
import 'package:whatsapp_copy/pages/callPage.dart';
import 'package:whatsapp_copy/pages/cameraPage.dart';
import 'package:whatsapp_copy/pages/chatPage.dart';
import 'package:whatsapp_copy/pages/statusPage.dart';

class MainPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  MainPage(this.cameras);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _tabController =
        TabController(vsync: this, initialIndex: 1, length: 4);

    var _shouldRenderFloatingAction = _tabController.index == 1;

    final _theme = Theme.of(context);

    final List<Map<String, String>> _status = [
      {"name": "matheus"},
      {"name": "pedro"},
      {"name": "alface"}
    ];

    final _appBar = AppBar(
      backgroundColor: _theme.appBarTheme.color,
      elevation: _theme.appBarTheme.elevation,
      title: Text(Constants.appName),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: _theme.iconTheme.color,
          ),
          onPressed: null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: _theme.iconTheme.color,
          ),
          onPressed: null,
        )
      ],
      bottom: TabBar(
        indicatorColor: _theme.indicatorColor,
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.camera_alt,
            ),
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
    );

    final getAvailableHeight = (BuildContext ctx) =>
        MediaQuery.of(ctx).size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Scaffold(
        appBar: _appBar,
        body: Container(
          height: getAvailableHeight(context),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              CameraPage(widget.cameras),
              ChatPage(["", ""]),
              StatusPage(_status),
              CallPage(_status),
            ],
          ),
        ),
        floatingActionButton: _shouldRenderFloatingAction
            ? FloatingActionButton(
                child: Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                onPressed: () {},
                splashColor: _theme.floatingActionButtonTheme.splashColor,
              )
            : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
