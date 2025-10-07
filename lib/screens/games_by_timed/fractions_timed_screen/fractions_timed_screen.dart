import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_custom.dart';
import 'operations_fraction_games/fraction_addition_timed_game_screen.dart';
import 'operations_fraction_games/fraction_division_timed_game_screen.dart';
import 'operations_fraction_games/fraction_multiplication_timed_game_screen.dart';
import 'operations_fraction_games/fraction_subtraction_timed_game_screen.dart';

class FractionsTimedScreen extends StatelessWidget {
  const FractionsTimedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Escolher jogo",
              style: TextStyle(
                  fontSize: 22
              ),
            ),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 180,
                textButton: "Adição",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionAdditionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 180,
                textButton: "Subtração",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionSubtractionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 180,
                textButton: "Multiplicação",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionMultiplicationGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 180,
                textButton: "Divisão",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionDivisionGameScreen())
                  );
                }),
          ],
        ),
      ),
    );
  }
}
