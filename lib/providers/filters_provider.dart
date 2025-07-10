import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactosFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactosFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
      return FiltersNotifier();
    });
