import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/division_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/multiplication_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/subtraction_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/numerical_expressions_screen/numerical_expressions_game/normal_numerical_expressions_game.dart';
import 'package:math_games_app/screens/games_by_points/numerical_expressions_screen/numerical_expressions_game/signs_numerical_expressions_game.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/addition_timed_game_screen.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/division_timed_game_screen.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/multiplication_timed_game_screen.dart';
import 'package:math_games_app/screens/games_by_timed/basic_operations_timed_screen/basic_operations_timed_games/subtraction_timed_game_screen.dart';
import 'package:math_games_app/widgets/button_custom.dart';
import 'package:provider/provider.dart';

import '../screens/games_by_points/basic_operation_screen/basic_operation_games/addition_game_screen.dart';
import '../screens/games_by_points/fractions_screen/operations_fraction_games/fraction_addition_game_screen.dart';
import '../screens/games_by_points/fractions_screen/operations_fraction_games/fraction_division_game_screen.dart';
import '../screens/games_by_points/fractions_screen/operations_fraction_games/fraction_multiplication_game_screen.dart';
import '../screens/games_by_points/fractions_screen/operations_fraction_games/fraction_subtraction_game_screen.dart';
import '../screens/games_by_timed/fractions_timed_screen/operations_fraction_games/fraction_addition_timed_game_screen.dart';
import '../screens/games_by_timed/fractions_timed_screen/operations_fraction_games/fraction_division_timed_game_screen.dart';
import '../screens/games_by_timed/fractions_timed_screen/operations_fraction_games/fraction_multiplication_timed_game_screen.dart';
import '../screens/games_by_timed/fractions_timed_screen/operations_fraction_games/fraction_subtraction_timed_game_screen.dart';
import '../screens/games_by_timed/numerical_expressions_timed_screen/numerical_expressions_game/normal_numerical_expressions_timed_game.dart';
import '../screens/games_by_timed/numerical_expressions_timed_screen/numerical_expressions_game/signs_numerical_expressions_timed_game.dart';

class CardGameChoiceCustom extends StatelessWidget {
  final IconData icon;
  final String textCard;
  final String typeCard;
  final Color color;
  final bool buttonActivated;

  const CardGameChoiceCustom({
    super.key,
    required this.icon,
    required this.textCard,
    required this.color,
    required this.buttonActivated,
    required this.typeCard
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
                          fontSize: 16,
                          color: Color(0x98272020)
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonCustom(
                        heightButton: 50,
                        widthButton: 100,
                        textButton: "Iniciar",
                        onPressed: () {
                          switch (typeCard) {
                            // Jogos de Operações Básicas por Pontos
                            case "Adição por Pontos":
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AdditionGameScreen()
                                )
                              );
                              break;
                            case "Subtração por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => SubtractionGameScreen()
                                  )
                              );
                              break;
                            case "Multiplicação por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MultiplicationGameScreen()
                                  )
                              );
                              break;
                            case "Divisão por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DivisionGameScreen()
                                  )
                              );
                              break;
                            // Jogos de Operações Básicas por Tempo
                            case "Adição por Tempo":
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AdditionTimedGameScreen()
                                )
                              );
                              break;
                            case "Subtração por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => SubtractionTimedGameScreen()
                                  )
                              );
                              break;
                            case "Multiplicação por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MultiplicationTimedGameScreen()
                                  )
                              );
                              break;
                            case "Divisão por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DivisionTimedGameScreen()
                                  )
                              );
                              break;
                            // Jogos de Frações por Pontos
                            case "Adição Fração por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionAdditionGameScreen()
                                  )
                              );
                              break;
                            case "Subtração Fração por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionSubtractionGameScreen()
                                  )
                              );
                              break;
                            case "Multiplicação Fração por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionMultiplicationGameScreen()
                                  )
                              );
                              break;
                            case "Divisão Fração por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionDivisionGameScreen()
                                  )
                              );
                              break;
                            // Jogos de Frações por Tempo
                            case "Adição Fração por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionAdditionTimedGameScreen()
                                  )
                              );
                              break;
                            case "Subtração Fração por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionSubtractionTimedGameScreen()
                                  )
                              );
                              break;
                            case "Multiplicação Fração por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionMultiplicationTimedGameScreen()
                                  )
                              );
                              break;
                            case "Divisão Fração por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => FractionDivisionTimedGameScreen()
                                  )
                              );
                              break;
                          // Jogos de Expressões por Pontos
                            case "Expressões Comuns por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => NormalNumericExpressionsGame()
                                  )
                              );
                              break;
                            case "Expressões Com Agrupadores por Pontos":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => SignsNumericalExpressionsGame()
                                  )
                              );
                              break;
                            // Jogos de Expressões por Tempo
                            case "Expressões Comuns por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => NormalNumericalExpressionsTimedGame()
                                  )
                              );
                              break;
                            case "Expressões Com Agrupadores por Tempo":
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => SignsNumericalExpressionsTimedGame()
                                  )
                              );
                              break;
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
