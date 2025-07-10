import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/meals.dart';
import 'package:food_app/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...availableCategories.map(
          (category) => CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
        ),
        // for (final category in availableCategories)
        //   CategoryGridItem(category: category),
      ],
    );
  }
}
