import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_custom.dart';
import 'basic_operation_games/addition_game_screen.dart';
import 'basic_operation_games/division_game_screen.dart';
import 'basic_operation_games/multiplication_game_screen.dart';
import 'basic_operation_games/potentiation_game_screen.dart';
import 'basic_operation_games/rooting_game_screen.dart';
import 'basic_operation_games/subtraction_game_screen.dart';

class BasicOperationsScreen extends StatelessWidget {
  const BasicOperationsScreen({super.key});

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
                textButton: "Adição",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AdditionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                textButton: "Subtração",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SubtractionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                textButton: "Multiplicação",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MultiplicationGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                textButton: "Divisão",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DivisionGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                textButton: "Potenciação",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PotentiationGameScreen())
                  );
                }),
            SizedBox(height: 30),
            ButtonCustom(
                textButton: "Radiciação",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RootingGameScreen())
                  );
                }),
          ],
        ),
      )
    );
  }
}
