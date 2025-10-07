import 'dart:async';
import 'dart:math';
import 'package:expressions/expressions.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class SignsNumericalExpressionsGame extends StatefulWidget {
  const SignsNumericalExpressionsGame({super.key});

  @override
  State<SignsNumericalExpressionsGame> createState() => _SignsNumericalExpressionsGameState();
}

class _SignsNumericalExpressionsGameState extends State<SignsNumericalExpressionsGame> {
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
    currentExpression = generateExpressionWithGroupers();
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

    if (resultText == evaluateExpressionWithGroupers(currentExpression)) {
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

  String generateExpressionWithGroupers() {
    List<String> operators = ['+', '-', '*', '/'];
    List<List<String>> groupers = [
      ['(', ')'],
      ['[', ']'],
      ['{', '}']
    ];

    List<String> parts = [];

    for (int i = 0; i < 4; i++) {
      String operator = operators[Random().nextInt(operators.length)];
      int a = Random().nextInt(9) + 1;
      int b = (operator == '/') ? Random().nextInt(9) + 1 : Random().nextInt(10);
      List<String> group = groupers[i % groupers.length];
      String internalExpression = '${group[0]}$a $operator $b${group[1]}';
      parts.add(internalExpression);
    }

    String result = parts[0];
    for (int i = 1; i < parts.length; i++) {
      String op = operators[Random().nextInt(operators.length)];
      result += ' $op ${parts[i]}';
    }

    return result;
  }

  int evaluateExpressionWithGroupers(String expressao) {
    try {
      String standard = expressao
          .replaceAll('[', '(')
          .replaceAll(']', ')')
          .replaceAll('{', '(')
          .replaceAll('}', ')');

      final expression = Expression.parse(standard);
      const evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expression, {});

      if (result is int) return result;
      if (result is double) return result.round();
      return 0;
    } catch (e) {
      print("Erro ao avaliar expressão: $expressao");
      print("Detalhe: $e");
      return 0;
    }
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
                    heightButton: 60,
                    widthButton: 180,
                    textButton: "Verificar",
                    color: Color(0xFF2196F3),
                    onPressed: numericExpressionsGame
                ),
                SizedBox(height: 20),
                if (_result.isNotEmpty)
                  Text(
                    "Resultado => $currentExpression = ${evaluateExpressionWithGroupers(currentExpression)} \n${_result}",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                SizedBox(height: 20),
                if (counter <= 10)
                  Column(
                    children: [
                      ButtonCustom(
                          heightButton: 60,
                          widthButton: 180,
                          textButton: "Próximo",
                          color: Color(0xFF2196F3),
                          onPressed: () {
                            setState(() {
                              _result = "";
                              _resultController.text = "";
                              currentExpression = generateExpressionWithGroupers();
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
                            heightButton: 60,
                            widthButton: 180,
                            textButton: "Jogar novamente",
                            color: Color(0xFF2196F3),
                            onPressed: () {
                              setState(() {
                                _result = "";
                                _resultController.text = "";
                                currentExpression = generateExpressionWithGroupers();
                                counter = 1;
                              });
                            }
                        ),
                        SizedBox(height: 10,),
                        ButtonCustom(
                            heightButton: 60,
                            widthButton: 180,
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
