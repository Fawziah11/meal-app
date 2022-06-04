import 'package:flutter/material.dart';
import 'package:meal_app/Screens/meal_detail_screen.dart';
import 'package:meal_app/Screens/tab_Screen.dart';
import 'package:meal_app/Wedges/Filter_Screen.dart';
import 'package:meal_app/Wedges/category_meal_screen.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/modul/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map <String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  void _setFilters(Map <String,bool> _filterData){
    setState(() {
      _filters = _filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']&& !meal.isGlutenFree){
          return false;
        };
        if (_filters['lactose']&& !meal.isGlutenFree){
          return false;
        };
        if (_filters['vegan']&& !meal.isVegan){
          return false;
        };
        if (_filters['vegetarian']&& !meal.isGlutenFree){
          return false;
        };
  return true;
      }).toList();

    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    // indexWhere ترجع الرقم -1 اذا العنصر غير موجود
    if (existingIndex>=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id == id);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1), // ياخذ منه لون ملئ الشاشة
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromARGB(255, 254, 229, 1), ),
          bodyText2: TextStyle(
            color: Color.fromARGB(255, 254, 229, 1),
          ),
          subtitle1: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          )
        )
      ),

      //home: MyHomePage(),
      //home: CategoriesScreen(),
      routes: {
        //'/' : (context)=>CategoriesScreen(),
        '/': (context)=>TabsScreen(_favoriteMeal),
        CategoryMealScreen.routName: (context)=>CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (context)=>MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName: (context)=>FilterScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Meal App"),
    ),
    body: null,
  );
}
}