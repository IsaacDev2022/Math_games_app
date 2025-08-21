import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';
import '../../../../widgets/button_custom.dart';

class PotentiationGameScreen extends StatefulWidget {
  const PotentiationGameScreen({super.key});

  @override
  State<PotentiationGameScreen> createState() => _PotentiationGameScreenState();
}

class _PotentiationGameScreenState extends State<PotentiationGameScreen> {
  final TextEditingController _powController = TextEditingController();
  String _result = "";

  var base = Random().nextInt(20);
  var exponent = Random().nextInt(10);
  var counter = 1;
  var hits = 0;
  var errors = 0;
  var i = 0;

  void potentiationNumbersGame() {
    final String powText = _powController.text;
    final int pow = int.tryParse(powText) ?? 0;

    final progress = Provider.of<GameProgressController>(context, listen: false);

    if (pow == potentiationNumbers(base, exponent)) {
      hits += 1;
      setState(() {
        _result = "CORRETO";
        progress.addPoints(10);
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO";
      });
    }
  }

  int potentiationNumbers(int base, int exponent) {
    var result = pow(base, exponent).toInt();
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
              SizedBox(height: 100),
              Text(
                "Pontuação Geral: ${progress.pointsCount}",
                style: TextStyle(
                    fontSize: 30
                ),
              ),
              SizedBox(height: 30),
              if (progress.pointsCount >= 150 && progress.pointsCount <= 160)
                Text(
                  "Parabéns, voce desbloqueou o jogo de Radiciação!!",
                  style: TextStyle(
                      fontSize: 30
                  ),
                ),
              SizedBox(height: 30),
              Text(
                "${base} ^ ${exponent} = ?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _powController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ButtonCustom(
                  textButton: "Verificar",
                  color: Color(0xFF2196F3),
                  onPressed: potentiationNumbersGame
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  "${base} ^ ${exponent} = ${potentiationNumbers(base, exponent)} => ${_result}",
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
                            _powController.text = "";
                            base = Random().nextInt(20);
                            exponent = Random().nextInt(10);
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
                              _powController.text = "";
                              base = Random().nextInt(20);
                              exponent = Random().nextInt(10);
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
