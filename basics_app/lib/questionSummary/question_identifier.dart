import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {

  const QuestionIdentifier(this.isCorrect,this.index,{super.key});

  final bool isCorrect;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 239, 230, 108)
            : const Color.fromARGB(255, 240, 113, 104),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        (index + 1).toString(),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
