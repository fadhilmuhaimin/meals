import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_providers.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetail extends ConsumerWidget {
  const MealsDetail({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? 'Added To Favorite'
                        : 'Removed From Favorite')));
              },
              icon: const Icon(Icons.star))
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(color: Colors.white),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            for (final step in meal.steps)
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    step,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white),
                  )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
