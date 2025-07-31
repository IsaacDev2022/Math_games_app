import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/numerical_expressions_screen/numerical_expressions_game/normal_numerical_expressions_game.dart';
import 'package:math_games_app/screens/numerical_expressions_screen/numerical_expressions_game/signs_numerical_expressions_game.dart';

import '../../widgets/button_custom.dart';

class NumericalExpressionsScreen extends StatelessWidget {
  const NumericalExpressionsScreen({super.key});

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
                  textButton: "Expressões Numéricas Normais",
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NormalNumericExpressionsGame())
                    );
                  }),
              SizedBox(height: 30),
              ButtonCustom(
                  textButton: "Exepressões Numéricas Com Símbolos",
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignsNumericalExpressionsGame())
                    );
                  }),
            ],
          )
      ),
    );
  }
}
