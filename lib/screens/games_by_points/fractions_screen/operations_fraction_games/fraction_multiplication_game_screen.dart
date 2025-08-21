import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              "X",
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
                "${numerador1} / ${denominador1} X ${numerador2} / ${denominador2} = " +
                "${multiplyFractionsNumerator(numerador1, numerador2)} / " +
                "${multiplyFractionsDenominator(denominador1, denominador2)} => " +
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
