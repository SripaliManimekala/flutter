import 'dart:io';

import 'package:favourite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:favourite_places/data/places.dart';

// final placesProvider = Provider((ref) => 
//   places
// );

class UserPlacesNotifier extends StateNotifier<List<Place>> {

  UserPlacesNotifier() : super([]);

  void addPlace(String title, File image) {
    final newPlace =  Place(title: title, image: image);
    state =[...state,newPlace];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier,List<Place>>(
  (ref) => UserPlacesNotifier());