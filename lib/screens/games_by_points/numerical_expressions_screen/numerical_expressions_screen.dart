import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/game_progress_controller.dart';
import '../../../widgets/button_custom.dart';
import '../../../widgets/card_game_choice_custom.dart';
import '../../../widgets/custom_appbar.dart';

class NumericalExpressionsScreen extends StatelessWidget {
  const NumericalExpressionsScreen({super.key});

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
                            typeCard: 'Expressões Comuns por Pontos',
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                            icon: Icons.remove,
                            textCard: "Expressões Com Agrupadores",
                            color: progress.isSubtractFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                            buttonActivated: progress.isSubtractFractionUnlocked() ? true : false,
                            typeCard: 'Expressões Com Agrupadores por Pontos',
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
