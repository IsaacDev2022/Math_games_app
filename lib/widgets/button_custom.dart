import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final Color color;

  const ButtonCustom({
    required this.textButton,
    required this.onPressed,
    required this.color,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: color
          ),
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.white
            ),
          ),
      ),
    );
  }
}
