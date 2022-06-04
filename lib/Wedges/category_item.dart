import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meal_app/Wedges/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

   CategoryItem(this.id, this.title, this.color);

   void selectCategory(BuildContext ctx){
     Navigator.of(ctx).pushNamed(CategoryMealScreen.routName,
       arguments: {
       'id': id, 'title': title/**/
       }
     );
   }

  @override
  Widget build(BuildContext context) {
    return InkWell( // اخترنه لان بداحلة دالة عند الضغط عليها تؤدي عمل معين
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15), // حتى يستمر التدوير عند الضغط على العنصر
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }

  }

