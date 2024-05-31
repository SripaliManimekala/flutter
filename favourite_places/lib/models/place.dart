import 'package:uuid/uuid.dart';
import 'dart:io';

final uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File image;

  Place({ required this.title,required this.image}) : id = uuid.v4();
}