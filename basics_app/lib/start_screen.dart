import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  const StartScreen (this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {

      return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,//will only take each widgets min size: image 300px
            children: [
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
                onPressed: startQuiz,
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