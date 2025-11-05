import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/widgets/card_timed_game_choice_custom.dart';
import 'package:provider/provider.dart';

import '../../../widgets/card_game_choice_custom.dart';
import '../../../widgets/custom_appbar.dart';


class BasicOperationsTimedScreen extends StatelessWidget {
  const BasicOperationsTimedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        body: Consumer<GameProgressController>(
          builder: (context, progress, child) {
            return Container(
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardTimedGameChoiceCustom(
                              icon: Icons.add,
                              textCard: "Adição",
                              color: Color(0xFFFF9940),
                              buttonActivated: progress.isAdditionTimedUnlocked() ? true : false
                          ),
                          SizedBox(width: 10),
                          CardTimedGameChoiceCustom(
                              icon: Icons.remove,
                              textCard: "Subtração",
                              color: progress.isSubtractTimedUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isSubtractTimedUnlocked() ? true : false
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardTimedGameChoiceCustom(
                              icon: Icons.close,
                              textCard: "Multiplicação",
                              color: progress.isMultiplicationTimedUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isMultiplicationTimedUnlocked() ? true : false
                          ),
                          SizedBox(width: 10),
                          CardTimedGameChoiceCustom(
                              icon: Icons.percent,
                              textCard: "Divisão",
                              color: progress.isDivideTimedUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isDivideTimedUnlocked() ? true : false
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
