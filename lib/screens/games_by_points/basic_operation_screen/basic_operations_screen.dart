import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:provider/provider.dart';

import '../../../widgets/button_custom.dart';
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
        body: Consumer<GameProgressController>(
          builder: (context, progress, child) {
            return Container(
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
                      color: Color(0xFFFF9940),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdditionGameScreen()));
                      }),
                  SizedBox(height: 30),
                  ButtonCustom(
                      textButton: "Subtração",
                      color: progress.isSubtractUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                      onPressed: () {
                        if (progress.isSubtractUnlocked()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SubtractionGameScreen())
                          );
                        }
                      }
                  ),
                  SizedBox(height: 30),
                  ButtonCustom(
                      textButton: "Multiplicação",
                      color: progress.isMultiplicationUnlocked() ? Color(
                          0xFFFF9029) : Color(0xFFBDBDBD),
                      onPressed: () {
                        if (progress.isMultiplicationUnlocked()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MultiplicationGameScreen())
                          );
                        }
                      }),
                  SizedBox(height: 30),
                  ButtonCustom(
                      textButton: "Divisão",
                      color: progress.isDivideUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                      onPressed: () {
                        if (progress.isDivideUnlocked()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DivisionGameScreen())
                          );
                        }
                      }),
                  SizedBox(height: 30),
                  ButtonCustom(
                      textButton: "Potenciação",
                      color: progress.isPotentiationUnlocked() ? Color(
                          0xFFECA552) : Color(0xFFBDBDBD),
                      onPressed: () {
                        if (progress.isSubtractUnlocked()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PotentiationGameScreen())
                          );
                        }
                      }),
                  SizedBox(height: 30),
                  ButtonCustom(
                      textButton: "Radiciação",
                      color: progress.isRootingUnlocked() ? Color(0xFFFF9029) : Color(0xFFBDBDBD),
                      onPressed: () {
                        if (progress.isRootingUnlocked()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RootingGameScreen())
                          );
                        }
                      }),
                ],
              ),
            );
          }
        )
    );
  }
}
