import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_custom.dart';

class MultiplicationGameScreen extends StatefulWidget {
  const MultiplicationGameScreen({super.key});

  @override
  State<MultiplicationGameScreen> createState() => _MultiplicationGameScreenState();
}

class _MultiplicationGameScreenState extends State<MultiplicationGameScreen> {
  final TextEditingController _multController = TextEditingController();
  String _result= "";

  var number1 = Random().nextInt(20);
  var number2 = Random().nextInt(20);
  var counter = 1;
  var hits = 0;
  var errors = 0;
  var i = 0;

  void multiplicationNumbersGame() {
    final String multText = _multController.text;
    final int mult = int.tryParse(multText) ?? 0;

    if (mult == multiplyNumbers(number1, number2)) {
      hits += 1;
      setState(() {
        _result = "CORRETO";
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO";
      });
    }
  }

  int multiplyNumbers(int num1, int num2) {
    return num1 * num2;
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
                "${number1} * ${number2} = ?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _multController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ButtonCustom(
                  textButton: "Verificar",
                  color: Color(0xFF2196F3),
                  onPressed: multiplicationNumbersGame
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  "${number1} * ${number2} = ${multiplyNumbers(number1, number2)} => ${_result}",
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
                            _multController.text = "";
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
                            _multController.text = "";
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
                )
            ],
          ),
        )
    );
  }
}

