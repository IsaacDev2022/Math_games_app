import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class SubtractionGameScreen extends StatefulWidget {
  const SubtractionGameScreen({super.key});

  @override
  State<SubtractionGameScreen> createState() => _SubtractionGameScreenState();
}

class _SubtractionGameScreenState extends State<SubtractionGameScreen> {
  final TextEditingController _subController = TextEditingController();
  String _result = "";

  var number1 = Random().nextInt(20);
  var number2 = Random().nextInt(20);
  var counter = 1;
  var hits = 0;
  var errors = 0;
  var i = 0;

  int generateNumber(int points) {
    if (points < 50) {
      return Random().nextInt(20); // 0 a 19
    } else if (points < 100) {
      return Random().nextInt(100); // 0 a 99
    } else {
      return Random().nextInt(1000); // 0 a 999
    }
  }

  void subtractionNumbersGame() {
    final String subText = _subController.text;
    final int sub = int.tryParse(subText) ?? 0;

    final progress = Provider.of<GameProgressController>(context, listen: false);

    if (sub == subtractNumbers(number1, number2)) {
      hits += 1;
      setState(() {
        _result = "CORRETO";
        progress.addPoints(10);
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO";
      });
    }
  }

  int subtractNumbers(int num1, int num2) {
    return num1 - num2;
  }

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<GameProgressController>(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                "Pontuação Geral: ${progress.pointsCount}",
                style: TextStyle(
                    fontSize: 30
                ),
              ),
              SizedBox(height: 30),
              if (progress.pointsCount >= 150 && progress.pointsCount <= 160)
                Text(
                  "Parabéns, voce desbloqueou o jogo de Multiplicação!!",
                  style: TextStyle(
                      fontSize: 30
                  ),
                ),
              SizedBox(height: 30),
              Text(
                "${number1} - ${number2} = ?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _subController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ButtonCustom(
                  textButton: "Verificar",
                  color: Color(0xFF2196F3),
                  onPressed: subtractionNumbersGame
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  "${number1} - ${number2} = ${subtractNumbers(number1, number2)} => ${_result}",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              SizedBox(height: 20),
              if (counter <= 10)
                Column(
                  children: [
                    ButtonCustom(
                        textButton: "Próximo",
                        color: Color(0xFF2196F3),
                        onPressed: () {
                          setState(() {
                            _result = "";
                            _subController.text = "";
                            number1 = generateNumber(progress.pointsCount);
                            number2 = generateNumber(progress.pointsCount);
                            counter += 1;
                            FocusScope.of(context).unfocus();
                          });
                        }
                    ),
                    SizedBox(height: 10,),
                    Text("${counter}"),
                  ],
                ),
              SizedBox(height: 20),
              if (counter == 10)
                Column(
                  children: [
                    Text(
                      "Fim do jogo",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "Acertos = ${hits}",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "Erros = ${errors}",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ButtonCustom(
                        textButton: "Jogar novamente",
                        color: Color(0xFF2196F3),
                        onPressed: () {
                          setState(() {
                            _result = "";
                            _subController.text = "";
                            number1 = generateNumber(progress.pointsCount);
                            number2 = generateNumber(progress.pointsCount);
                            counter = 1;
                          });
                        }
                    ),
                    SizedBox(height: 10,),
                    ButtonCustom(
                        textButton: "Voltar",
                        color: Color(0xFF2196F3),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                    ),
                  ],
                )
            ],
          ),
        )
    );
  }
}



