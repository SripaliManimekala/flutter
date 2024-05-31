import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImge;
  var _camera = false;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 600); //will return a future//can use camera or gallery
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _camera = true;
      _selectedImge = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImge!);
  }

    void _pickPicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 600); //will return a future//can use camera or gallery
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _camera = false;
      _selectedImge = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImge!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
        onPressed: _takePicture,
        icon: const Icon( Icons.camera),
        label: const Text('Take Picture')),
        const SizedBox(width: 10,),
        TextButton.icon(
        onPressed: _pickPicture,
        icon:const Icon( Icons.image),
        label: const Text('Pick from Gallery'))
      ],
    );
    
    if (_selectedImge != null) {
      content = GestureDetector(
        onTap: _camera ?_takePicture : _pickPicture,
        child: Image.file(
          _selectedImge!,
          fit: BoxFit.cover,
          // width: double.infinity,
          // height: double.infinity,
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1.0),
        ),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: content);
  }
}
