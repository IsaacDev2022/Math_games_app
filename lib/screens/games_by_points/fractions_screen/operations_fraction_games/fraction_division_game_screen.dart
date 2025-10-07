import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/button_custom.dart';

class FractionDivisionGameScreen extends StatefulWidget {
  const FractionDivisionGameScreen({super.key});


  @override
  State<FractionDivisionGameScreen> createState() => _FractionDivisionGameState();

}

class _FractionDivisionGameState extends State<FractionDivisionGameScreen> {
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
    numerador == divideFractionsNumerator(numerador1, denominador2) &&
    denominador == divideFractionsDenominator(numerador2, denominador1)
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

  divideFractionsNumerator(
      int numerador1,
      int denominador2,
      ) {
    return numerador1 * denominador2;
  }

  divideFractionsDenominator(
      int numerador2,
      int denominador1,
      ) {
    return numerador2 * denominador1;
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
              "/",
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
                heightButton: 60,
                widthButton: 180,
                textButton: "Verificar",
                color: Color(0xFF2196F3),
                onPressed: multiplyFractionsGame
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Text(
                "${numerador1} / ${denominador1} -/- ${numerador2} / ${denominador2} = " +
                    "${divideFractionsNumerator(numerador1, denominador2)} / " +
                    "${divideFractionsDenominator(numerador2, denominador1)} => " +
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
                      heightButton: 60,
                      widthButton: 180,
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
