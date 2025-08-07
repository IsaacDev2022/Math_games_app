import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_games_app/controller/game_progress_controller.dart';
import 'package:math_games_app/widgets/button_custom.dart';

class AdditionGameScreen extends StatefulWidget {
  const AdditionGameScreen({super.key});

  @override
  State<AdditionGameScreen> createState() => _AdditionGameScreenState();
}

class _AdditionGameScreenState extends State<AdditionGameScreen> {
  final TextEditingController _addController = TextEditingController();
  String _result = "";

  final gameProgressController = GameProgressController();

  var number1 = Random().nextInt(20);
  var number2 = Random().nextInt(20);
  var counter = 1;
  var hits = 0;
  var errors = 0;
  var i = 0;

  void addNumbersGame() {
    final String somaText = _addController.text;
    final int add = int.tryParse(somaText) ?? 0;

    if (add == addNumbers(number1, number2)) {
      hits += 1;
      setState(() {
        _result = "CORRETO";
        gameProgressController.additionPoints += 5;
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO";
      });
    }
  }

  int addNumbers(int num1, int num2) {
    return num1 + num2;
  }

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
              "${number1} + ${number2} = ?",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _addController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Verificar",
                color: Color(0xFF2196F3),
                onPressed: addNumbersGame
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Text(
                "${number1} + ${number2} = ${addNumbers(number1, number2)} => ${_result}",
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
                          _addController.text = "";
                          number1 = Random().nextInt(20);
                          number2 = Random().nextInt(20);
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
              Container(
                alignment: Alignment.center,
                child: Column(
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
                            _addController.text = "";
                            number1 = Random().nextInt(20);
                            number2 = Random().nextInt(20);
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
                ),
              )
          ],
        ),
      )
    );
  }
}
