import 'dart:io';

import 'package:favourite_places/providers/places_provider.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:favourite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceStateScreenState();
  }
}

class _AddPlaceStateScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File?  _selectedImge;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }
  void _savePlace() {
    final enteredTitle = _titleController.text;
    if(enteredTitle.isEmpty || _selectedImge == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle,_selectedImge!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(label: Text('Title')),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
           ),
           const SizedBox(height: 10,),
           ImageInput(onPickImage: (image) {
            _selectedImge =image;
           } ,),
           const SizedBox(height: 10,),
           const LocationInput(),
           const SizedBox(height: 10,),
           ElevatedButton.icon(
            onPressed: _savePlace, 
            icon: const Icon(Icons.add), 
            label: const Text('Add Place'))
          ],
        ),
      )
    );
  }
}