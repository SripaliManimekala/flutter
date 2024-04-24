import 'package:basics_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:basics_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  //questions + chosenAnswers
  List<Map> getSummaryData() {

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'you answerd 5 out of 10 questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 179, 127, 237),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              'question1',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 179, 127, 237),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              'Provided Answer',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 93, 5, 200),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              'Correct Answer',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 45, 78, 212),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                // backgroundColor:const Color.fromARGB(255, 64, 5, 109),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
              ),
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
