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
  int total = 10;

  @override
  void initState() {
    super.initState();
    currentExpression = generateExpressionWithGroupers();
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
    final progress = Provider.of<GameProgressController>(context);
    double counterProgress = counter / total;

    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Text(
                  "Pontuação Geral: ${progress.pointsCount}",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFECA552),
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 50),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 320,
                      height: 420,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA64F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (counter < 10) ...[
                            SizedBox(height: 30),
                            Text(
                              "$currentExpression = ?",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                              child: TextField(
                                controller: _resultController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xFFECA552)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xFFFF7F00)),
                                  ),
                                  filled: true,
                                  hintText: '0',
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            if (_result == "CORRETO")
                              Column(
                                  children: [
                                    Icon(Icons.emoji_events, color: Colors.yellowAccent, size: 58),
                                    SizedBox(height: 20),

                                    SizedBox(height: 20),
                                    Text("Parabéns, voce acertou!!",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white
                                        )),
                                  ]
                              ),
                            if (_result == "ERRADO")
                              Column(
                                  children: [
                                    Icon(Icons.clear, color: Colors.red, size: 48),
                                    SizedBox(height: 20),

                                    SizedBox(height: 20),
                                    Text("Voce errou!! Tente a próxima",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white
                                        )),
                                  ]
                              ),
                            ButtonCustom(
                              heightButton: 60,
                              widthButton: 180,
                              textButton: "Verificar",
                              color: Color(0xFF225385),
                              onPressed: () {
                                numericExpressionsGame();
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ],
                          if (counter == 10)
                            Column(
                              children: [
                                SizedBox(height: 80),
                                Text(
                                  "Fim do jogo",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Acertos = ${hits}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(
                                      "Erros = ${errors}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                                ButtonCustom(
                                    heightButton: 60,
                                    widthButton: 180,
                                    textButton: "Recomeçar",
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
                                SizedBox(height: 20),
                                ButtonCustom(
                                  heightButton: 60,
                                  widthButton: 180,
                                  textButton: "Sair",
                                  color: Color(0xFF225385),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                    Positioned(
                      top: -30,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFF6CA91),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 90,
                                height: 90,
                                child: CircularProgressIndicator(
                                  value: counterProgress,
                                  strokeWidth: 10,
                                  backgroundColor: Colors.orange.withOpacity(0.2),
                                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF225385)),
                                ),
                              ),
                              Container(
                                width: 65,
                                height: 65,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '$counter',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                if (_result.isNotEmpty)
                  ButtonCustom(
                      heightButton: 60,
                      widthButton: 180,
                      textButton: "Próximo",
                      color: Color(0xFFFF7F00),
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
              ],
            ),
          )
      ),
    );
  }
}
