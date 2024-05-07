import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

//we can use this provider in widgets that need meals
final mealsProvider = Provider((ref) {
  return dummyMeals;
});