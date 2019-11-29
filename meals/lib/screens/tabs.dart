import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/favorites.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _pages = [
    {"title": "Categories", "page": CategoriesScreen()},
    {"title": "Your Favorites!", "page": FavoritesScreen()},
  ];

  var _selectedPageIndex = 0;

  void _handleSelectPage(int index) =>
      setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages.elementAt(_selectedPageIndex)["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages.elementAt(_selectedPageIndex)["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _handleSelectPage,
        backgroundColor: _theme.primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: _theme.accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: _theme.primaryColor,
              icon: const Icon(Icons.category),
              title: const Text("Categories")),
          BottomNavigationBarItem(
              backgroundColor: _theme.primaryColor,
              icon: const Icon(Icons.star),
              title: const Text("Favorites"))
        ],
      ),
    );
  }
}
