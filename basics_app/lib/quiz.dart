import 'package:basics_app/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:basics_app/start_screen.dart';
import 'package:flutter/widgets.dart';


class Quiz extends StatefulWidget {

  const Quiz({super.key});

@override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class  _QuizState extends State<Quiz> {
  //managing the state
  Widget activeScreen = const StartScreen();
  
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            child: activeScreen),
      ),
    );
  }
}