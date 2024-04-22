import 'package:flutter/material.dart';
import 'package:basics_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 64, 5, 109),
                  Color.fromARGB(255, 87, 15, 143)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const StartScreen()),
      ),
    ),
  );
}
