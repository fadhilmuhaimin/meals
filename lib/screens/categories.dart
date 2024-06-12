import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.onToggleFavorite, required this.avaiableMealss});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> avaiableMealss;
  void _selectedCategories(BuildContext context, Category category, ){
    final filteredMeals = avaiableMealss.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => Meals(title: category.title, meals: filteredMeals,onToggleFavorite: onToggleFavorite,),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,childAspectRatio: 3/2),
            children: [
              for(final category in availableCategories)
                CategoryGridItem(category: category, selected : (){_selectedCategories(context,category);})
            ]
      ),
    );
  }
}
