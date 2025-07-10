import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactosFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree] ?? false;
    _lactosFreeFilterSet = widget.currentFilters[Filter.lactosFree] ?? false;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian] ?? false;
    _veganFilterSet = widget.currentFilters[Filter.vegan] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactosFree: _lactosFreeFilterSet,
              Filter.vegetarian: _vegetarianFilterSet,
              Filter.vegan: _veganFilterSet,
            });
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                // Handle the change
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
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
              value: _lactosFreeFilterSet,
              onChanged: (isChecked) {
                // Handle the change
                setState(() {
                  _lactosFreeFilterSet = isChecked;
                });
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
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                // Handle the change
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: const Text("Vegetarian"),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                // Handle the change
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: const Text("Vegan"),
            ),
          ],
        ),
      ),
    );
  }
}
