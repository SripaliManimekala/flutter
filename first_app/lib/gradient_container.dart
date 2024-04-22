import 'package:flutter/material.dart';
import 'package:first_app/styledText.dart';
import 'package:first_app/dice_roller.dart';

var startAlign;
//use final if never reassign
const endAlign = Alignment.bottomRight;
const welcomeMsg = 'Hi Codevus';

// class GradientContainer extends StatelessWidget{

//   const GradientContainer(this.colors,{super.key});//forward the key to parent class: statelessWidget

//   final List<Color> colors; //List of Colors for gradient
//   @override
//   Widget build(BuildContext context) {

//     startAlign = Alignment.topLeft;

//     // throw UnimplementedError();
//     return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: colors,
//               begin:startAlign ,
//               end: endAlign,
//             ),
//           ),
//           child: const Center(
//             child: StyledText(welcomeMsg),
//           ),
//         );
//   }
// }

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2,
      {super.key}); //forward the key to parent class: statelessWidget

  //create another constructor
  const GradientContainer.lightGreen({super.key})
      : color1 = const Color.fromARGB(255, 141, 205, 143),
        color2 = Colors.green;

  final Color color1;
  final Color color2;


  @override
  Widget build(BuildContext context) {
    startAlign = Alignment.topLeft;

    // throw UnimplementedError();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlign,
          end: endAlign,
        ),
      ),
      child:const Center(
        child: DiceRoller(),
      ),
    );
  }
}
