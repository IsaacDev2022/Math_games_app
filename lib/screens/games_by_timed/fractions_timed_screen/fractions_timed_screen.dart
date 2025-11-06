import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/custom_appbar.dart';

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
      appBar: const CustomAppbar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Escolher jogo",
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFFFF9940),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 80),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Adição",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionAdditionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Subtração",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionSubtractionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Multiplicação",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionMultiplicationGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Divisão",
                color: Color(0xFFFF9940),
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
