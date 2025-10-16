import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/widgets/card_game_choice_custom.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_drawer.dart';

class BasicOperationsScreen extends StatelessWidget {
  const BasicOperationsScreen({super.key});

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
                          CardGameChoiceCustom(
                              icon: Icons.add,
                              textCard: "Adição",
                              color: Color(0xFFFF9940),
                              buttonActivated: progress.isSubtractUnlocked() ? true : false
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                              icon: Icons.remove,
                              textCard: "Subtração",
                              color: progress.isSubtractUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isSubtractUnlocked() ? true : false
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
                              color: progress.isMultiplicationUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isMultiplicationUnlocked() ? true : false
                          ),
                          SizedBox(width: 10),
                          CardGameChoiceCustom(
                              icon: Icons.percent,
                              textCard: "Divisão",
                              color: progress.isDivideUnlocked() ? Color(0xFFFF9940) : Color(0xFFBDBDBD),
                              buttonActivated: progress.isDivideUnlocked() ? true : false
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
