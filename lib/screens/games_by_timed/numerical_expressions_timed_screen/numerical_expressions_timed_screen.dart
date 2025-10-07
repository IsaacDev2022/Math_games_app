import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_custom.dart';
import 'numerical_expressions_game/normal_numerical_expressions_timed_game.dart';
import 'numerical_expressions_game/signs_numerical_expressions_timed_game.dart';

class NumericalExpressionsTimedScreen extends StatelessWidget {
  const NumericalExpressionsTimedScreen({super.key});

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
                  heightButton: 60,
                  widthButton: 180,
                  textButton: "Expressões Numéricas Normais",
                  color: Color(0xFF2196F3),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NormalNumericExpressionsGame())
                    );
                  }),
              SizedBox(height: 30),
              ButtonCustom(
                  heightButton: 60,
                  widthButton: 180,
                  textButton: "Exepressões Numéricas Com Símbolos",
                  color: Color(0xFF2196F3),
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
