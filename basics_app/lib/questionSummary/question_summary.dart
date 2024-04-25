import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basics_app/questionSummary/question_identifier.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.qData, {super.key});

  final Map<String, Object> qData;

  bool isCorrect() {
    if(qData['user_choice'] == qData['correct_answer']){
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(isCorrect(), (qData['question_index']as int)),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                qData['question'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 178, 225, 233),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 5),
              Text(
                qData['user_choice'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 123, 234, 248),
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 2),
              Text(
                qData['correct_answer'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 219, 246, 144),
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
