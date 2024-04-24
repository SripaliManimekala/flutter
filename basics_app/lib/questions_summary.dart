import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            return Row(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color:  data['user_choice'] == data['correct_answer']
                    ? const Color.fromARGB(255, 239, 230, 108)
                    : const Color.fromARGB(255, 240, 113, 104),
                    shape: BoxShape.circle,
                    ),
                  alignment: Alignment.center,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(), 
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
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Color.fromARGB(255, 178, 225, 233),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_choice'] as String,
                        style: GoogleFonts.lato(
                          color: Color.fromARGB(255, 123, 234, 248),
                          fontSize: 15, 
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: Color.fromARGB(255, 219, 246, 144),
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
          }).toList(),
        ),
      ),
    );
  }
}
