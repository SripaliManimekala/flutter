import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {}

final favouritesProvider = StateNotifierProvider((ref) => null);