import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';

import '../../widgets/button_custom.dart';
import 'basic_operation_games/addition_game_screen.dart';
import 'basic_operation_games/division_game_screen.dart';
import 'basic_operation_games/multiplication_game_screen.dart';
import 'basic_operation_games/potentiation_game_screen.dart';
import 'basic_operation_games/rooting_game_screen.dart';
import 'basic_operation_games/subtraction_game_screen.dart';

class BasicOperationsScreen extends StatelessWidget {
  // const BasicOperationsScreen({super.key});

  final gameProgressController = GameProgressController();

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
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 30),
          ButtonCustom(
              textButton: "Adição",
              color: Color(0xFF2196F3),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdditionGameScreen()));
              }),
          SizedBox(height: 30),
          ButtonCustom(
              textButton: "Subtração",
              color: Color(0xFF2196F3),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SubtractionGameScreen()));
              }),
          SizedBox(height: 30),
          ButtonCustom(
              textButton: "Multiplicação",
              color: Color(0xFF2196F3),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MultiplicationGameScreen()));
              }),
          SizedBox(height: 30),
          ButtonCustom(
              textButton: "Divisão",
              color: Color(0xFF2196F3),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DivisionGameScreen()));
              }),
          SizedBox(height: 30),
          ButtonCustom(
              textButton: "Potenciação",
              color: Color(0xFF2196F3),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PotentiationGameScreen()));
              }),
          SizedBox(height: 30),
          ButtonCustom(
              textButton: "Radiciação",
              color: Color(0xFF2196F3),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RootingGameScreen()));
              }),
        ],
      ),
    ));
  }
}
