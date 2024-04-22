import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 134, 227, 255),
        body:  GradientContainer(
           Color.fromARGB(255, 2, 87, 109),
           Color.fromARGB(255, 73, 184, 201)),
        // body:  GradientContainer([Color.fromARGB(255, 3, 68, 160),Color.fromARGB(255, 75, 144, 224)]),
        // body: GradientContainer.lightGreen()//additional constructor function
      ),
    ),
  );
}

