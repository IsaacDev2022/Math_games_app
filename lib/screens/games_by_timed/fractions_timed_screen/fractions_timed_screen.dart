import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../controller/game_progress_controller.dart';
import '../../../widgets/button_custom.dart';
import '../../../widgets/card_game_choice_custom.dart';
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
      body: Consumer<GameProgressController>(
          builder: (context, progress, child) {
            return Container(
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardGameChoiceCustom(
                            icon: Icons.add,
                            textCard: "Adição",
                            color: progress.isAdditionFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isAdditionFractionUnlocked() ? true : false,
                            typeCard: 'Adição Fração por Tempo',
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                            icon: Icons.remove,
                            textCard: "Subtração",
                            color: progress.isSubtractFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isSubtractFractionUnlocked() ? true : false,
                            typeCard: 'Subtração Fração por Tempo',
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardGameChoiceCustom(
                            icon: Icons.close,
                            textCard: "Multiplicação",
                            color: progress.isMultiplicationFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isMultiplicationFractionUnlocked() ? true : false,
                            typeCard: 'Multiplicação Fração por Tempo',
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                            icon: Icons.percent,
                            textCard: "Divisão",
                            color: progress.isDivideFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isDivideFractionUnlocked() ? true : false,
                            typeCard: 'Divisão Fração por Tempo',
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      )
    );
  }
}
