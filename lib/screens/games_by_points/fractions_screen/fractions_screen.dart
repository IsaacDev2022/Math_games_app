import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/card_fraction_game_choice_custom.dart';
import 'package:provider/provider.dart';

import '../../../controller/game_progress_controller.dart';
import '../../../widgets/button_custom.dart';
import '../../../widgets/card_game_choice_custom.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_drawer.dart';
import 'operations_fraction_games/fraction_addition_game_screen.dart';
import 'operations_fraction_games/fraction_division_game_screen.dart';
import 'operations_fraction_games/fraction_multiplication_game_screen.dart';
import 'operations_fraction_games/fraction_subtraction_game_screen.dart';

class FractionsScreen extends StatelessWidget {
  const FractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        drawer: CustomDrawer(),
        body: Consumer<GameProgressController>(
            builder: (context, progress, child) {
              return Container(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Escolher jogo",
                      style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFFFF9940),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 80),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CardFractionGameChoiceCustom(
                                icon: Icons.add,
                                textCard: "Adição",
                                color: progress.isAdditionFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                                buttonActivated: progress.isAdditionFractionUnlocked() ? true : false
                            ),
                            SizedBox(width: 10),
                            CardFractionGameChoiceCustom(
                                icon: Icons.remove,
                                textCard: "Subtração",
                                color: progress.isSubtractFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                                buttonActivated: progress.isSubtractFractionUnlocked() ? true : false
                            )
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CardFractionGameChoiceCustom(
                                icon: Icons.close,
                                textCard: "Multiplicação",
                                color: progress.isMultiplicationFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                                buttonActivated: progress.isMultiplicationFractionUnlocked() ? true : false
                            ),
                            SizedBox(width: 10),
                            CardFractionGameChoiceCustom(
                                icon: Icons.percent,
                                textCard: "Divisão",
                                color: progress.isDivideFractionUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                                buttonActivated: progress.isDivideFractionUnlocked() ? true : false
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
