import 'package:flutter/material.dart';
import 'package:meal_app/Screens/meal_detail_screen.dart';
import 'package:meal_app/modul/meal.dart';

class MealItem extends StatelessWidget {
  final String imageURL;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({@required this.imageURL,
    @required this.id,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability, });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
        arguments: id // نمرر الرقم للصفحه عند استدعائها
    ).then((result){
      //if(result !=null) removeItem(result);


    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return "UnKnown";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "UnKnown";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4, // الارتفاع
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              // عشان نرتب العناصر فوق بعض
              children: [
                ClipRRect(
                  // هذي الاداه تستخد حتى نجبر الصوره ان يتم قصها و وضعها في مكان معين
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageURL,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // تجبر الصورة بأن تكون داخل شي حوافه مدورة الشكل
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text("$affordabilityText"),
                    ],
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
