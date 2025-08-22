import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class RootingGameScreen extends StatefulWidget {
  const RootingGameScreen({super.key});

  @override
  State<RootingGameScreen> createState() => _RootingGameScreenState();
}

class _RootingGameScreenState extends State<RootingGameScreen> {
  final TextEditingController _rootingController = TextEditingController();
  String _result = "";

  var number = Random().nextInt(20);
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

  void rootingNumbersGame() {
    final String rootText = _rootingController.text;
    final int squareRoot = int.tryParse(rootText) ?? 0;

    if (squareRoot == rottingNumbers(number)) {
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

  double rottingNumbers(int number) {
    var result = sqrt(number).toDouble();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<GameProgressController>(context);

    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Raiz quadrade de ${number} = ?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _rootingController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ButtonCustom(
                  textButton: "Verificar",
                  color: Color(0xFF2196F3),
                  onPressed: rootingNumbersGame
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  "Raiz quadrada de ${number} = ${rottingNumbers(number)} => ${_result}",
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
                            _rootingController.text = "";
                            number = generateNumber(progress.pointsCount);
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
                              _rootingController.text = "";
                              number = generateNumber(progress.pointsCount);
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
