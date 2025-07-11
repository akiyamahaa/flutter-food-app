import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              // Handle the change
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Only include gluten-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          SwitchListTile(
            value: filters[Filter.lactosFree]!,
            onChanged: (isChecked) {
              // Handle the change
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactosFree, isChecked);
            },
            title: Text(
              "lactos-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              "Only include lactos-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              // Handle the change
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: const Text("Vegetarian"),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (isChecked) {
              // Handle the change
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: const Text("Vegan"),
          ),
        ],
      ),
    );
  }
}
