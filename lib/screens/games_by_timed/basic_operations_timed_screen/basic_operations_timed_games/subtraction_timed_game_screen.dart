import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class SubtractionTimedGameScreen extends StatefulWidget {
  const SubtractionTimedGameScreen({super.key});

  @override
  State<SubtractionTimedGameScreen> createState() => _SubtractionTimedGameScreenState();
}

class _SubtractionTimedGameScreenState extends State<SubtractionTimedGameScreen> {
  final TextEditingController _addController = TextEditingController();
  String _result = "";

  late Timer _timer;
  int _timeLeft = 60;

  var number1 = 0;
  var number2 = 0;
  var hits = 0;
  var errors = 0;
  var counter = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startGame();
    });
  }

  void _startGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
    // progress.reset();

    _timeLeft = 60;
    _generateNumbers(progress.pointsCount);

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

  void _generateNumbers(int points) {
    setState(() {
      if (points < 50) {
        number1 = Random().nextInt(20);
        number2 = Random().nextInt(20);
      } else if (points < 100) {
        number1 = Random().nextInt(100);
        number2 = Random().nextInt(100);
      } else {
        number1 = Random().nextInt(1000);
        number2 = Random().nextInt(1000);
      }
    });
  }

  void subNumbersGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
    final String somaText = _addController.text;
    final int add = int.tryParse(somaText) ?? 0;

    if (add == subNumbers(number1, number2)) {
      hits += 1;
      setState(() {
        _result = "CORRETO";
        progress.addPoints(10);
        _timeLeft += 10; // bônus de tempo
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO";
      });
    }

    _addController.clear();
    _generateNumbers(progress.pointsCount);
  }

  int subNumbers(int num1, int num2) {
    return num1 - num2;
  }

  @override
  void dispose() {
    _timer.cancel();
    _addController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<GameProgressController>(context);

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
                          if (_timeLeft > 0) ...[
                            if (_result == "") ... [
                              SizedBox(height: 30),
                              Text(
                                "${number1} - ${number2} = ?",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                child: TextField(
                                  controller: _addController,
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
                            ],
                            if (_result == "CORRETO")
                              Column(
                                  children: [
                                    SizedBox(height: 60),
                                    Icon(Icons.emoji_events, color: Colors.yellowAccent, size: 58),
                                    SizedBox(height: 30),
                                    // Text("${number1} + ${number2} = ${addNumbers(number1, number2)}",
                                    //     style: TextStyle(
                                    //         fontSize: 30,
                                    //         color: Colors.white
                                    //     )),
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
                                    SizedBox(height: 60),
                                    Icon(Icons.clear, color: Colors.red, size: 48),
                                    SizedBox(height: 30),
                                    // Text("${number1} + ${number2} = ${addNumbers(number1, number2)}",
                                    //     style: TextStyle(
                                    //         fontSize: 20,
                                    //         color: Colors.white
                                    //     )),
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
                                subNumbersGame();
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ],
                          if (_timeLeft == 0)
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
                                        hits = 0;
                                        errors = 0;
                                        _result = "";
                                        _startGame();
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
                              // SizedBox(
                              //   width: 90,
                              //   height: 90,
                              //   child: CircularProgressIndicator(
                              //     value: counterProgress,
                              //     strokeWidth: 10,
                              //     backgroundColor: Colors.orange.withOpacity(0.2),
                              //     valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF225385)),
                              //   ),
                              // ),
                              Container(
                                width: 65,
                                height: 65,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '$_timeLeft s',
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
                          _addController.text = "";
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
