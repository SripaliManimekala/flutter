// import 'package:favourite_places/data/places.dart';
import 'package:favourite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places added yet!'),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PlaceDetailsScreen(place: places[index])));
        },
      ),
    );
  }
}
