import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetail extends StatelessWidget {
  const MealsDetail({super.key,required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Column(
        children: [
          FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl))
        ],
      ),
    );
  }
}