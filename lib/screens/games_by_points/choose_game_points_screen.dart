import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/button_custom.dart';

import 'basic_operation_screen/basic_operations_screen.dart';
import 'fractions_screen/fractions_screen.dart';
import 'numerical_expressions_screen/numerical_expressions_screen.dart';

class ChooseGamePointsScreen extends StatelessWidget {
  const ChooseGamePointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonCustom(
                textButton: "Jogos de Operações",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BasicOperationsScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Jogos de Frações",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionsScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Jogos de Expressões Numéricas",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NumericalExpressionsScreen())
                  );
                }
            ),
          ],
        ),
      )
    );
  }
}
