import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/division_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/multiplication_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/subtraction_game_screen.dart';
import 'package:math_games_app/widgets/button_custom.dart';
import 'package:provider/provider.dart';

import '../screens/games_by_points/basic_operation_screen/basic_operation_games/addition_game_screen.dart';

class CardGameChoiceCustom extends StatelessWidget {
  final IconData icon;
  final String textCard;
  final Color color;
  final bool buttonActivated;

  const CardGameChoiceCustom({
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
                                    builder: (context) => AdditionGameScreen()
                                )
                            );
                          } else if (textCard == "Subtração" && progress.isSubtractUnlocked()) {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SubtractionGameScreen()
                                )
                            );
                          } else if (textCard == "Multiplicação" && progress.isMultiplicationUnlocked()) {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => MultiplicationGameScreen()
                                )
                            );
                          } else if (textCard == "Divisão" && progress.isDivideUnlocked()) {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => DivisionGameScreen()
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
