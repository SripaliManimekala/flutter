import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {//generic class

  FavouriteMealNotifier() : super([]);//we pass our initial data to super

  //add any method to edit this data
  void toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite){
      //if the meal is in favourites, remove it from there
      state = state.where((m)=> m.id!=meal.id ).toList();
    } else {
        state = [...state, meal];
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});