import 'package:flutter/material.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/tabs.dart';

class MainDrawer extends StatelessWidget {
  _buildListTile(String title, IconData icon, Function onTap) => ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: _theme.accentColor,
            child: Center(
              child: Text(
                "Cooking up",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: _theme.primaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile(
              "Meals",
              Icons.restaurant,
              () => Navigator.of(context)
                  .pushReplacementNamed(TabsScreen.routeName)),
          _buildListTile(
              "Settings",
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName)),
        ],
      ),
    );
  }
}
