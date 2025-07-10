import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/choose_game_screen.dart';
import 'package:math_games_app/widgets/button_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Jogos de matemática",
              style: TextStyle(
                fontSize: 28
              ),
            ),
            SizedBox(height: 100),
            ButtonCustom(
                textButton: "Iniciar",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChooseGameScreen())
                  );
                }
            )
          ],
        )
      ),
    );
  }
}
