import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../controller/game_progress_controller.dart';
import '../../../widgets/button_custom.dart';
import '../../../widgets/card_game_choice_custom.dart';
import 'numerical_expressions_game/normal_numerical_expressions_timed_game.dart';
import 'numerical_expressions_game/signs_numerical_expressions_timed_game.dart';

class NumericalExpressionsTimedScreen extends StatelessWidget {
  const NumericalExpressionsTimedScreen({super.key});

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
                            textCard: "Expressões Normais",
                            color: progress.isAdditionFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isAdditionFractionUnlocked() ? true : false,
                            typeCard: 'Expressões Comuns por Tempo',
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                            icon: Icons.remove,
                            textCard: "Expressões Com Agrupadores",
                            color: progress.isSubtractFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isSubtractFractionUnlocked() ? true : false,
                            typeCard: 'Expressões Com Agrupadores por Tempo',
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
