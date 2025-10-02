import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/button_custom.dart';
import 'package:math_games_app/widgets/custom_appbar.dart';

import 'basic_operation_screen/basic_operations_screen.dart';
import 'fractions_screen/fractions_screen.dart';
import 'numerical_expressions_screen/numerical_expressions_screen.dart';

class ChooseGamePointsScreen extends StatelessWidget {
  const ChooseGamePointsScreen({super.key});

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
                textButton: "Operações Básicas",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BasicOperationsScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Frações",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FractionsScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Expressões Numéricas",
                color: Color(0xFFFF9940),
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
