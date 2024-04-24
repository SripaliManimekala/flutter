import 'package:basics_app/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:basics_app/start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //managing the state
  // Widget? activeScreen ;//? indicates active state can also be null or widget

  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen'; //identifier

  //initialization work when the state object of this class is created
  // @override
  // void initState() {//called just after the object was created
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);

  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }
  
  void chooeseAnswer(String answer) {//call this and pass answer whenever we click on a answer
    selectedAnswers.add(answer);
  }
 
  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {//forward chooseanswer function to question screen widget
      screenWidget =  QuestionsScreen(onSelectAnswer: chooeseAnswer,);
    }
    

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
            child: screenWidget),
      ),
    );
  }
}
