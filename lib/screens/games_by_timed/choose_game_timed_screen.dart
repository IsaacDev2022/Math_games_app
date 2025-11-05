import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_screen.dart';
import 'package:math_games_app/widgets/button_custom.dart';

import '../../widgets/custom_appbar.dart';
import 'fractions_timed_screen/fractions_timed_screen.dart';
import 'numerical_expressions_timed_screen/numerical_expressions_timed_screen.dart';

class ChooseGameTimedScreen extends StatelessWidget {
  const ChooseGameTimedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Escolha um tipo de jogo",
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFFFF9940),
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 100),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Jogos de Operações",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BasicOperationsTimedScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Jogos de Frações",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionsTimedScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                heightButton: 60,
                widthButton: 240,
                textButton: "Jogos de Expressões",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NumericalExpressionsTimedScreen())
                  );
                }
            ),
          ],
        ),
      )
    );
  }
}
