
import 'package:flutter/material.dart';
import 'package:meal_app/Screens/categories_screen.dart';
import 'package:meal_app/Screens/favorite_Screen.dart';
import 'package:meal_app/Wedges/category_meal_screen.dart';
import 'package:meal_app/Wedges/mainDrawer.dart';
import 'package:meal_app/modul/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  const TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List <Map<String,Object>> _pages ;
  int selectedPageIndex=0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoriteScreen(widget.favoriteMeal),
        'title': 'Favorite'
      }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      selectedPageIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorite"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
