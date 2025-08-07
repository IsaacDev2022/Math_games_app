import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_custom.dart';

class FractionAdditionGameScreen extends StatefulWidget {
  const FractionAdditionGameScreen({super.key});

  @override
  State<FractionAdditionGameScreen> createState() => _FractionAdditionGameScreenState();
}

class _FractionAdditionGameScreenState extends State<FractionAdditionGameScreen> {
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

  void multiplyFractionsGame() {
    final String numeradorText = _numeradorController.text;
    final int numerador = int.tryParse(numeradorText) ?? 0;

    final String denominadorText = _denominadorController.text;
    final int denominador = int.tryParse(denominadorText) ?? 0;

    if (
    numerador == toAddFractionsNumerator(numerador1, numerador2, denominador1, denominador2) &&
    denominador == toAddFractionsNumerator(numerador1, numerador2, denominador1, denominador2)
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

  calculateMmc(int den1, int den2) {
    var num1 = den1;
    var num2 = den2;
    var result1 = 0;
    var result2 = 0;
    var mmc = 1;
    var v = 0;
    var np = [2, 3, 5, 7, 11, 13];

    for (int i = 0; i <= 50; i++) {
      if (num1 % np[v] == 0 && num2 % np[v] == 0) {
        result1 = (num1 / np[v]) as int;
        result2 = (num2 / np[v]) as int;
        num1 = result1;
        num2 = result2;
      } else if (num1 % np[v] == 0 && num2 % np[v] != 0) {
        result1 = (num1 / np[v]) as int;
        num1 = result1;
      } else if (num1 % np[v] != 0 && num2 % np[v] == 0) {
        result2 = (num2 / np[v]) as int;
        num2 = result2;
      } else if (num1 % np[v] != 0 && num2 % np[v] != 0) {
        v++;
        continue;
      }
      mmc *= np[v];
      if (num1 == 1 && num2 == 1) {
        break;
      }
    }

    return mmc;
  }

  toAddFractionsNumerator(
      int numerador1,
      int numerador2,
      int denominador1,
      int denominador2
      ) {
    if (denominador1 == denominador2) {
      resultado1 = numerador1 + numerador2;
    } else {
      var mmc = calculateMmc(denominador1, denominador2);
      resultado1 = ((mmc / denominador1) * numerador1) + ((mmc / denominador2) * numerador2);
    }

    return resultado1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "${numerador1} / ${denominador1}",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            Text(
              "+",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            Text(
              "${numerador2} / ${denominador2}",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _numeradorController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _denominadorController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ButtonCustom(
                textButton: "Verificar",
                color: Color(0xFF2196F3),
                onPressed: multiplyFractionsGame
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Text(
                "${numerador1} / ${denominador1} + ${numerador2} / ${denominador2} = " +
                    "${toAddFractionsNumerator(numerador1, numerador2, denominador1, denominador2)} + " +
                    "${toAddFractionsNumerator(denominador1, denominador2, denominador1, denominador2)} => " +
                    "${_result}",
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
                  SizedBox(height: 10,),
                  Text("${counter}"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

