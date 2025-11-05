import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/addition_timed_game_screen.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/division_timed_game_screen.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/multiplication_timed_game_screen.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/subtraction_timed_game_screen.dart';
import 'package:provider/provider.dart';

import '../controller/game_progress_controller.dart';
import 'button_custom.dart';

class CardTimedGameChoiceCustom extends StatelessWidget {
  final IconData icon;
  final String textCard;
  final Color color;
  final bool buttonActivated;

  const CardTimedGameChoiceCustom({
    super.key,
    required this.icon,
    required this.textCard,
    required this.color,
    required this.buttonActivated
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProgressController>(
        builder: (context, progress, child) {
          return Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 170,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6CA91),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        textCard,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0x98272020)
                        ),
                      ),
                      const SizedBox(height: 20),
                      ButtonCustom(
                          heightButton: 50,
                          widthButton: 100,
                          textButton: "Iniciar",
                          onPressed: () {
                            if (textCard == "Adição") {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => AdditionTimedGameScreen()
                                  )
                              );
                            } else if (textCard == "Subtração" && progress.isSubtractTimedUnlocked()) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => SubtractionTimedGameScreen()
                                  )
                              );
                            } else if (textCard == "Multiplicação" && progress.isMultiplicationTimedUnlocked()) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MultiplicationTimedGameScreen()
                                  )
                              );
                            } else if (textCard == "Divisão" && progress.isDivideTimedUnlocked()) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DivisionTimedGameScreen()
                                  )
                              );
                            }
                          },
                          color: color
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: color,
                    child: Icon(icon, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
