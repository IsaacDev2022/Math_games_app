import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/division_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/multiplication_game_screen.dart';
import 'package:math_games_app/screens/games_by_points/basic_operation_screen/basic_operation_games/subtraction_game_screen.dart';
import 'package:math_games_app/widgets/card_game_choice_custom.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'basic_operation_games/addition_game_screen.dart';


class BasicOperationsScreen extends StatelessWidget {
  const BasicOperationsScreen({super.key});

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
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFFFF9940),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardGameChoiceCustom(
                              icon: Icons.add,
                              textCard: "Adição",
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => AdditionGameScreen()
                                  )
                                );
                              }
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                              icon: Icons.remove,
                              textCard: "Subtração",
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => SubtractionGameScreen()
                                    )
                                );
                              }
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardGameChoiceCustom(
                              icon: Icons.close,
                              textCard: "Multiplicação",
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => MultiplicationGameScreen()
                                    )
                                );
                              }
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                              icon: Icons.percent,
                              textCard: "Divisão",
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DivisionGameScreen()
                                    )
                                );
                              }
                          )
                        ],
                      ),
                    ],
                  )

                  // ButtonCustom(
                  //     heightButton: 60,
                  //     widthButton: 180,
                  //     textButton: "Adição",
                  //     color: Color(0xFFFF9940),
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => AdditionGameScreen()));
                  //     }),
                  // SizedBox(height: 30),
                  // ButtonCustom(
                  //     heightButton: 60,
                  //     widthButton: 180,
                  //     textButton: "Subtração",
                  //     color: progress.isSubtractUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                  //     onPressed: () {
                  //       if (progress.isSubtractUnlocked()) {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => SubtractionGameScreen())
                  //         );
                  //       }
                  //     }
                  // ),
                  // SizedBox(height: 30),
                  // ButtonCustom(
                  //     heightButton: 60,
                  //     widthButton: 180,
                  //     textButton: "Multiplicação",
                  //     color: progress.isMultiplicationUnlocked() ? Color(
                  //         0xFFFF9029) : Color(0xFFBDBDBD),
                  //     onPressed: () {
                  //       if (progress.isMultiplicationUnlocked()) {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => MultiplicationGameScreen())
                  //         );
                  //       }
                  //     }),
                  // SizedBox(height: 30),
                  // ButtonCustom(
                  //     heightButton: 60,
                  //     widthButton: 180,
                  //     textButton: "Divisão",
                  //     color: progress.isDivideUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                  //     onPressed: () {
                  //       if (progress.isDivideUnlocked()) {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => DivisionGameScreen())
                  //         );
                  //       }
                  //     }),
                  // SizedBox(height: 30),
                  // ButtonCustom(
                  //     heightButton: 60,
                  //     widthButton: 180,
                  //     textButton: "Potenciação",
                  //     color: progress.isPotentiationUnlocked() ? Color(
                  //         0xFFECA552) : Color(0xFFBDBDBD),
                  //     onPressed: () {
                  //       if (progress.isSubtractUnlocked()) {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => PotentiationGameScreen())
                  //         );
                  //       }
                  //     }),
                  // SizedBox(height: 30),
                  // ButtonCustom(
                  //     heightButton: 60,
                  //     widthButton: 180,
                  //     textButton: "Radiciação",
                  //     color: progress.isRootingUnlocked() ? Color(0xFFFF9029) : Color(0xFFBDBDBD),
                  //     onPressed: () {
                  //       if (progress.isRootingUnlocked()) {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => RootingGameScreen())
                  //         );
                  //       }
                  //     }),
                ],
              ),
            );
          }
        )
    );
  }
}
