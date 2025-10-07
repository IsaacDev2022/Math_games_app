import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color color;
  final double heightButton;
  final double widthButton;

  const ButtonCustom({
    required this.textButton,
    required this.onPressed,
    required this.color,
    required this.heightButton,
    required this.widthButton,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightButton,
      width: widget.widthButton,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.deepOrangeAccent;  // cor durante o toque
                }
                return widget.color;   // cor normal
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            )
        ),
        child: Text(
          widget.textButton,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}


// class ButtonCustom extends StatelessWidget {
//   final String textButton;
//   final VoidCallback onPressed;
//   final Color color;
//
//   const ButtonCustom({
//     required this.textButton,
//     required this.onPressed,
//     required this.color,
//     Key? key
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: 280,
//       child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             backgroundColor: color
//           ),
//           child: Text(
//             textButton,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//       ),
//     );
//   }
// }
