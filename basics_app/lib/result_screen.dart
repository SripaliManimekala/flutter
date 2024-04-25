import 'package:flutter/material.dart';
import 'package:basics_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basics_app/questionSummary/questions_summary.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen(this.restartQuiz, {super.key, required this.chosenAnswers});

  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  //questions + chosenAnswers
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for(var i=0; i<chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_choice': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],//assumption: 1st answer is the correct one
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    // final summaryData =  getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((element) 
      => element['user_choice']== element['correct_answer']
    ).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answerd $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color:const Color.fromARGB(255, 251, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom( 
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
              ),
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
