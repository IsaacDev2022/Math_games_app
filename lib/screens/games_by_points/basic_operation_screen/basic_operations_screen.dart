import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/widgets/card_game_choice_custom.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_drawer.dart';

class BasicOperationsScreen extends StatelessWidget {
  const BasicOperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        drawer: CustomDrawer(),
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
                              color: Color(0xFFFF9940),
                              buttonActivated: progress.isSubtractUnlocked() ? true : false,
                              typeCard: 'Adição por Pontos',
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                              icon: Icons.remove,
                              textCard: "Subtração",
                              color: progress.isSubtractUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isSubtractUnlocked() ? true : false,
                              typeCard: 'Subtração por Pontos',
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
                              color: progress.isMultiplicationUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isMultiplicationUnlocked() ? true : false,
                              typeCard: 'Multiplicação por Pontos',
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                              icon: Icons.percent,
                              textCard: "Divisão",
                              color: progress.isDivideUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isDivideUnlocked() ? true : false,
                              typeCard: 'Divisão por Pontos',
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
