import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/addition_timed_game_screen.dart';
import 'package:provider/provider.dart';

import '../../../widgets/button_custom.dart';


class BasicOperationsTimedScreen extends StatelessWidget {
  const BasicOperationsTimedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<GameProgressController>(
          builder: (context, progress, child) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Escolher jogo",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 30),
                  ButtonCustom(
                      textButton: "Adição",
                      color: Color(0xFF2196F3),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdditionTimedGameScreen()));
                      }),
                  SizedBox(height: 30),
                ],
              ),
            );
          }
        )
    );
  }
}
