import 'package:basics_app/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:basics_app/start_screen.dart';
import 'package:basics_app/data/questions.dart';
import 'package:basics_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen'; //identifier


  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }
  
  void chooeseAnswer(String answer) {//call this and pass answer whenever we click on a answer
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      //if ran oout of questions
      //call set state to trigger the build method again
      setState(() {
        activeScreen = 'result-screen';
      });
    }

  }
  
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {//forward chooseanswer function to question screen widget
      screenWidget =  QuestionsScreen(onSelectAnswer: chooeseAnswer,);
    } 
    if(activeScreen == 'result-screen') {
      screenWidget = ResultScreen(restartQuiz, chosenAnswers: selectedAnswers,);
    }
    

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromARGB(255, 67, 131, 215),
                  Color.fromARGB(255, 42, 108, 201)
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
