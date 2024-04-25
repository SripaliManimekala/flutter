import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.qData, {super.key});

  final Map<String, Object> qData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: qData['user_choice'] == qData['correct_answer']
                ? const Color.fromARGB(255, 239, 230, 108)
                : const Color.fromARGB(255, 240, 113, 104),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            ((qData['question_index'] as int) + 1).toString(),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
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
