import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {//generic class

  FavouriteMealNotifier() : super([]);//we pass our initial data to super

  //add any method to edit this data
  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite){
      //if the meal is in favourites, remove it from there
      //state= current state managed by state notifier
      state = state.where((m)=> m.id!=meal.id ).toList();
      return false;
    } else {
        state = [...state, meal];
        return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});