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
  int total = 10;

  @override
  void initState() {
    super.initState();
    currentExpression = generateExpression();
  }

  numericExpressionsGame() {
    final String resultText = _resultController.text;

    if (resultText == evaluateExpression(currentExpression).toString()) {
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
                                        currentExpression = generateExpression();
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
                          currentExpression = generateExpression();
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


    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      heightButton: 60,
                      widthButton: 180,
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
                        heightButton: 60,
                        widthButton: 180,
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
    );
  }
}

