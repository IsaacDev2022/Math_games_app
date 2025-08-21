import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/games_by_points/choose_game_points_screen.dart';
import 'package:math_games_app/screens/games_by_timed/choose_game_timed_screen.dart';

import '../widgets/button_custom.dart';

class ChooseTypeGameScreen extends StatelessWidget {
  const ChooseTypeGameScreen({super.key});

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
                textButton: "Jogos por Pontos",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChooseGamePointsScreen())
                  );
                }
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Jogos por Tempo",
                color: Color(0xFF2196F3),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChooseGameTimedScreen())
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
