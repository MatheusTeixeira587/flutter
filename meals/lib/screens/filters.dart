import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Map<String, bool> filters;
  final void Function(Map<String, bool>) setFilters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeMeals = false;
  var _vegetarianMeals = false;
  var _veganMeals = false;
  var _lactoseFreeMeals = false;

  SwitchListTile _buildSwitchTile(
      String title, String subtitle, value, void Function(bool) onChange) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: onChange,
    );
  }

  @override
  void initState() {
    super.initState();
    _glutenFreeMeals = widget.filters["gluten"];
    _lactoseFreeMeals = widget.filters["lactose"];
    _vegetarianMeals = widget.filters["vegetarian"];
    _veganMeals = widget.filters["vegan"];
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Set your own filters",
              style: _theme.textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    "Gluten-free",
                    "Only include gluten-free meals.",
                    _glutenFreeMeals,
                    (newValue) => setState(() => _glutenFreeMeals = newValue)),
                _buildSwitchTile(
                    "Lactose-free",
                    "Only include lactose-free meals.",
                    _lactoseFreeMeals,
                    (newValue) => setState(() => _lactoseFreeMeals = newValue)),
                _buildSwitchTile(
                    "Vegan",
                    "Only include vegan meals.",
                    _veganMeals,
                    (newValue) => setState(() => _veganMeals = newValue)),
                _buildSwitchTile(
                    "Vegetarian",
                    "Only include vegetarian meals.",
                    _vegetarianMeals,
                    (newValue) => setState(() => _vegetarianMeals = newValue))
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => widget.setFilters({
          "gluten": _glutenFreeMeals,
          "vegan": _veganMeals,
          "vegetarian": _vegetarianMeals,
          "lactose": _lactoseFreeMeals,
        }),
      ),
    );
  }
}
