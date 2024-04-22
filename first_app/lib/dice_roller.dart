import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {

  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();
  var currentDiceRoll = 2;

  void rollDice() {
    //where we update the value we call this function
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
    print('changing image..');
  }
  @override
  //needs to execute build method again and again
  Widget build(context) {
    return Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Image.asset(
              'assets/images/dice-$currentDiceRoll.png',
              width: 200,
            ),
            TextButton(
              onPressed: rollDice, //pointer to the function
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white, 
                textStyle: const TextStyle(
                  fontSize: 28,
                  ),
                ),
              child: const Text('Roll Dice'))
          ],
        );
  }
}