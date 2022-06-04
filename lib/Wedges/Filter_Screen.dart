import 'package:flutter/material.dart';
import 'package:meal_app/Wedges/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilter;

  const FilterScreen(this.currentFilter, this.saveFilters);


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

   @override
   initState(){
      _glutenFree = widget.currentFilter['gluten'];
      _lactoseFree = widget.currentFilter['lactose'];
      _vegan = widget.currentFilter['vegan'];
      _vegetarian = widget.currentFilter['vegetarian'];
     super.initState();
   }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your Filter"),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String,bool> selectedFilter= {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your mael selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  "Gluten-free", "only include Gluten-free meal", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile(
                  "Lactose-free", "only include Lactose-free meal", _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchListTile(
                  "vegetarian", "only include vegetarian meal", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              buildSwitchListTile(
                  "vegan", "only include vegan meal", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
