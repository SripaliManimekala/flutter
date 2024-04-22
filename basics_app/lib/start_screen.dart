import 'package:flutter/material.dart';
import 'package:basics_app/quiz.dart';

class StartScreen extends StatelessWidget {

  const StartScreen ({super.key});


  @override
  Widget build(BuildContext context) {

      return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,//will only take each widgets min size: image 300px
            children: [
              // Opacity(
              //   opacity: 0.5,
              //   child: Image.asset(
              //     'assets/images/quiz-logo.png',
              //     width: 300,
              //   ),
              // ),
              Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                  color: const Color.fromARGB(150, 255, 255, 255) ,
                ),
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 30),
                child: Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
                ),
              ),),
              OutlinedButton.icon(
                onPressed: switchScreen(  ),
                style: OutlinedButton.styleFrom(
                  // backgroundColor:const Color.fromARGB(255, 64, 5, 109),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz')),
            ],
          ),
        );
  }
}