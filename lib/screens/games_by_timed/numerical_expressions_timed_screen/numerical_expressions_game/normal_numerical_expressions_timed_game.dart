import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class NormalNumericExpressionsGame extends StatefulWidget {
  const NormalNumericExpressionsGame({super.key});

  @override
  State<NormalNumericExpressionsGame> createState() => _NormalNumericExpressionsGameState();
}

class _NormalNumericExpressionsGameState extends State<NormalNumericExpressionsGame> {
  final TextEditingController _resultController = TextEditingController();
  String _result = "";
  late String currentExpression;

  var counter = 1;
  var hits = 0;
  var errors = 0;
  var i = 0;

  late Timer _timer;
  int _timeLeft = 60;

  @override
  void initState() {
    super.initState();
    currentExpression = generateExpression();
    _startGame();
  }

  void _startGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
    progress.reset();

    _timeLeft = 60;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _endGame();
      }
    });
  }

  void _endGame() {
    _timer.cancel();
    setState(() {
      _result = "Tempo Esgotado!";
    });
  }

  numericExpressionsGame() {
    final String resultText = _resultController.text;

    if (resultText == evaluateExpression(currentExpression).toString()) {
      hits += 1;
      setState(() {
        _result = "CORRETO";
        _timeLeft += 10;
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO";
      });
    }
  }

  String generateExpression() {
    List<String> operators = ['+', '-', '*', '/'];
    StringBuffer sb = StringBuffer();

    sb.write(Random().nextInt(9) + 1);

    for (int i = 0; i < 4; i++) {
      String operator = operators[Random().nextInt(operators.length)];
      int numero = (operator == '/') ? Random().nextInt(9) + 1 : Random().nextInt(10);
      sb.write(' $operator $numero');
    }

    return sb.toString();
  }

  int evaluateExpression(String expression) {
    List<String> tokens = expression.split(' ');
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double number = double.parse(tokens[i + 1]);

      switch (operator) {
        case '+':
          result += number;
          break;
        case '-':
          result -= number;
          break;
        case '*':
          result *= number;
          break;
        case '/':
          result /= number;
          break;
      }
    }

    return result.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Tempo: $_timeLeft s",
                style: TextStyle(fontSize: 26, color: Colors.red),
              ),
              SizedBox(height: 40),
              Text(
                "$currentExpression = ?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _resultController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ButtonCustom(
                  textButton: "Verificar",
                  color: Color(0xFF2196F3),
                  onPressed: numericExpressionsGame
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  "Resultado => $currentExpression = ${evaluateExpression(currentExpression)} \n${_result}",
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
                            _resultController.text = "";
                            currentExpression = generateExpression();
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
                              _resultController.text = "";
                              currentExpression = generateExpression();
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
      )
    );
  }
}

