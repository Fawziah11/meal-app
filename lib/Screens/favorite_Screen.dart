import 'package:flutter/material.dart';
import 'package:meal_app/Wedges/meal_item.dart';
import 'package:meal_app/modul/meal.dart';


class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

   FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text("you have not yet Favorite"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            imageURL: favoriteMeal[index].imageUrl,
            id : favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,

          );
        },
        itemCount: favoriteMeal.length,
      );

    }
  }
}

