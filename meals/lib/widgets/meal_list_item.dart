import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.meal});

  String get complexityText {//get complexity  as Complexity
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip
          .hardEdge, //enforce the shape by cutting out any content that go outside the shape
      elevation: 2, //give some 3D effect to the card
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, //image is cutoff and fixed
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black54,
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, //example text ...
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12,),
                        MealItemTrait(
                          icon: Icons.work,
                          label: '${complexityText}',// meal.complexity.name
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
