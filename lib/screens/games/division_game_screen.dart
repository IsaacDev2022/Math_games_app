import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_custom.dart';

class DivisionGameScreen extends StatefulWidget {
  const DivisionGameScreen({super.key});

  @override
  State<DivisionGameScreen> createState() => _DivisionGameScreenState();
}

class _DivisionGameScreenState extends State<DivisionGameScreen> {
  final TextEditingController _divController = TextEditingController();
  String _resultado = "";

  var numero1 = Random().nextInt(20);
  var numero2 = Random().nextInt(20);
  var contador = 1;
  var acertos = 0;
  var erros = 0;
  var i = 0;

  void divisionNumbersGame() {
    final String somaText = _divController.text;
    final int soma = int.tryParse(somaText) ?? 0;

    if (soma == divNumbers(numero1, numero2)) {
      acertos += 1;
      setState(() {
        _resultado = "CORRETO";
      });
    } else {
      erros += 1;
      setState(() {
        _resultado = "ERRADO";
      });
    }
  }

  double divNumbers(int num1, int num2) {
    return num1 / num2;
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
                "${numero1} / ${numero2} = ?",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _divController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ButtonCustom(
                  textButton: "Verificar",
                  onPressed: divisionNumbersGame
              ),
              SizedBox(height: 20),
              if (_resultado.isNotEmpty)
                Text(
                  "${numero1} / ${numero2} = ${divNumbers(numero1, numero2)} => ${_resultado}",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              SizedBox(height: 20),
              if (contador <= 10)
                Column(
                  children: [
                    ButtonCustom(
                        textButton: "Próximo",
                        onPressed: () {
                          setState(() {
                            _resultado = "";
                            _divController.text = "";
                            numero1 = Random().nextInt(20);
                            numero2 = Random().nextInt(20);
                            contador += 1;
                            FocusScope.of(context).unfocus();
                          });
                        }
                    ),
                    SizedBox(height: 10,),
                    Text("${contador}"),
                  ],
                ),
              SizedBox(height: 20),
              if (contador == 10)
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
                          "Acertos = ${acertos}",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "Erros = ${erros}",
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
                            _resultado = "";
                            _divController.text = "";
                            numero1 = Random().nextInt(20);
                            numero2 = Random().nextInt(20);
                            contador = 1;
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

