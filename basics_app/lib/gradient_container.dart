import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {

  const GradientContainer({super.key});


  @override
  Widget build(BuildContext context) {

      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color.fromARGB(255, 64, 5, 109),Color.fromARGB(255, 64, 5, 109)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child : Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 200,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 30),
                child: Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),),
              ElevatedButton(
                onPressed: () {print('button pressed');},
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 64, 5, 109),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 15,
                  ),
                ), 
                child: const Text('Start Quiz')),
            ],
          ),
        ),
      );
  }
}