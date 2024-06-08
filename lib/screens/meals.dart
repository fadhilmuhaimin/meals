import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Uh oh ... nothing here!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16,),
          Text("Try selecting diffrent category",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onBackground
          ))
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) =>
          Text(
            meals[index].title, style: TextStyle(color: Colors.amber),
          )
        ,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title,style: TextStyle(color: Colors.white),),
        ),
        body: content,);
  }
}
