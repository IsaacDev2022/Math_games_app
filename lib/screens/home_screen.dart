import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/choose_type_game_screen.dart';
import 'package:math_games_app/widgets/button_custom.dart';
import 'package:math_games_app/widgets/card_game_choice_custom.dart';
import 'package:math_games_app/widgets/custom_drawer.dart';

import '../widgets/custom_appbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      drawer: CustomDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/MathGamesOrangeLogo.png"),
            SizedBox(height: 20),
            Text(
              "Bem Vindo ao",
              style: TextStyle(
                fontSize: 26,
                color: Color(0xFFFF9940)
              ),
            ),
            Text(
              "Math Games",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF9940)
              ),
            ),
            SizedBox(height: 100),
            ButtonCustom(
                heightButton: 60,
                widthButton: 180,
                textButton: "Iniciar",
                color: Color(0xFFFF9940),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChooseTypeGameScreen())
                  );
                },
            ),
            SizedBox(height: 20),
          ],
        )
      ),
    );
  }
}
