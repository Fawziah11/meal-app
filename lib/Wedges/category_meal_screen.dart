import 'package:flutter/material.dart';
import 'package:meal_app/Wedges/meal_item.dart';
import 'package:meal_app/modul/meal.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = 'category_meal';
  final List<Meal> availableMeal;

  const CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayedMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageURL: displayedMeal[index].imageUrl,
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
