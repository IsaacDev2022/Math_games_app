import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_custom.dart';

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

  void subtractionNumbersGame() {
    final String subText = _subController.text;
    final int sub = int.tryParse(subText) ?? 0;

    if (sub == subractNumbers(number1, number2)) {
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

  int subractNumbers(int num1, int num2) {
    return num1 - num2;
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
                  onPressed: subtractionNumbersGame
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  "${number1} - ${number2} = ${subractNumbers(number1, number2)} => ${_result}",
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
                        onPressed: () {
                          setState(() {
                            _result = "";
                            _subController.text = "";
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
                        onPressed: () {
                          setState(() {
                            _result = "";
                            _subController.text = "";
                            number1 = Random().nextInt(20);
                            number2 = Random().nextInt(20);
                            counter = 1;
                          });
                        }
                    ),
                    SizedBox(height: 10,),
                    ButtonCustom(
                        textButton: "Voltar",
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



