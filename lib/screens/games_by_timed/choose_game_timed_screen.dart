import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_screen.dart';
import 'package:math_games_app/widgets/button_custom.dart';

import '../games_by_points/basic_operation_screen/basic_operations_screen.dart';
import '../games_by_points/fractions_screen/fractions_screen.dart';
import '../games_by_points/numerical_expressions_screen/numerical_expressions_screen.dart';

class ChooseGameTimedScreen extends StatelessWidget {
  const ChooseGameTimedScreen({super.key});

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
                    MaterialPageRoute(builder: (context) => BasicOperationsTimedScreen())
                  );
                }
            ),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}
