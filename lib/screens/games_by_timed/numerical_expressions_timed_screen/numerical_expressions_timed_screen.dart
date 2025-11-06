import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/custom_appbar.dart';

import '../../../widgets/button_custom.dart';
import 'numerical_expressions_game/normal_numerical_expressions_timed_game.dart';
import 'numerical_expressions_game/signs_numerical_expressions_timed_game.dart';

class NumericalExpressionsTimedScreen extends StatelessWidget {
  const NumericalExpressionsTimedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 180),
              Text(
                "Escolher jogo",
                style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFFFF9940),
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 50),
              ButtonCustom(
                  heightButton: 60,
                  widthButton: 280,
                  textButton: "Expressões Normais",
                  color: Color(0xFFFF9940),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NormalNumericExpressionsGame())
                    );
                  }),
              SizedBox(height: 30),
              ButtonCustom(
                  heightButton: 60,
                  widthButton: 280,
                  textButton: "Exepressões Com Símbolos",
                  color: Color(0xFFFF9940),
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
