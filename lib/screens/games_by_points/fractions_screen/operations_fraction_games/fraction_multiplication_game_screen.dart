import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class FractionMultiplicationGameScreen extends StatefulWidget {
  const FractionMultiplicationGameScreen({super.key});

  @override
  State<FractionMultiplicationGameScreen> createState() => _FractionMultiplicationGameState();
}

class _FractionMultiplicationGameState extends State<FractionMultiplicationGameScreen> {
  final TextEditingController _numeradorController = TextEditingController();
  final TextEditingController _denominadorController = TextEditingController();
  String _result = "";

  var numerador1 = Random().nextInt(10);
  var denominador1 = Random().nextInt(10);
  var numerador2 = Random().nextInt(10);
  var denominador2 = Random().nextInt(10);
  var resultado1 = 0;
  var resultado2 = 0;

  var counter = 1;
  var hits = 0;
  var errors = 0;
  var i = 0;
  int total = 10;

  void multiplyFractionsGame() {
    final String numeradorText = _numeradorController.text;
    final int numerador = int.tryParse(numeradorText) ?? 0;

    final String denominadorText = _denominadorController.text;
    final int denominador = int.tryParse(denominadorText) ?? 0;

    if (
    numerador == multiplyFractionsNumerator(numerador1, numerador2) &&
    denominador == multiplyFractionsDenominator(denominador1, denominador2)
    ) {
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

  multiplyFractionsNumerator(
      int numerador1,
      int numerador2,
      ) {
    return numerador1 * numerador2;
  }

  multiplyFractionsDenominator(
      int denominador1,
      int denominador2,
      ) {
    return denominador1 * denominador2;
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
                      height: 450,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA64F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 20),
                          if (counter < 10) ...[
                            if (_result == "") ...[
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "${numerador1}",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        width: 40,
                                        height: 4,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "${denominador1}",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    "X",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    children: [
                                      Text(
                                        "${numerador2}",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        width: 40,
                                        height: 4,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "${denominador2}",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "=",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "?",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _numeradorController,
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
                                      SizedBox(height: 20),
                                      TextField(
                                        controller: _denominadorController,
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
                                    ],
                                  )
                              ),
                            ],
                            if (_result == "CORRETO")
                              Column(
                                  children: [
                                    Icon(Icons.emoji_events, color: Colors.yellowAccent, size: 58),
                                    SizedBox(height: 20),
                                    Text(
                                      "${numerador1} / ${denominador1} X ${numerador2} / ${denominador2} = " +
                                          "${multiplyFractionsNumerator(numerador1, numerador2)} / " +
                                          "${multiplyFractionsDenominator(denominador1, denominador2)} => " +
                                          "${_result}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
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
                                    Text(
                                      "${numerador1} / ${denominador1} X ${numerador2} / ${denominador2} = " +
                                          "${multiplyFractionsNumerator(numerador1, numerador2)} / " +
                                          "${multiplyFractionsDenominator(denominador1, denominador2)} => " +
                                          "${_result}",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text("Voce errou!! Tente a próxima",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white
                                        )),
                                  ]
                              ),
                            SizedBox(height: 20),
                            ButtonCustom(
                              heightButton: 60,
                              widthButton: 180,
                              textButton: "Verificar",
                              color: Color(0xFF225385),
                              onPressed: () {
                                multiplyFractionsGame();
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
                                        _numeradorController.text = "";
                                        _denominadorController.text = "";
                                        numerador1 = Random().nextInt(10);
                                        numerador1 = Random().nextInt(10);
                                        denominador1 = Random().nextInt(10);
                                        denominador2 = Random().nextInt(10);
                                        counter = 1;
                                        FocusScope.of(context).unfocus();
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
                          _numeradorController.text = "";
                          _denominadorController.text = "";
                          numerador1 = Random().nextInt(10);
                          numerador1 = Random().nextInt(10);
                          denominador1 = Random().nextInt(10);
                          denominador2 = Random().nextInt(10);
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
