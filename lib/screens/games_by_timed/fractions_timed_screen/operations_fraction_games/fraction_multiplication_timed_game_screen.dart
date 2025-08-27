import 'dart:async';
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

  late Timer _timer;
  int _timeLeft = 60;

  @override
  void initState() {
    super.initState();
    _startMultiplicationTimedFractionsGame();
  }

  void _generateNumbers(int points) {
    setState(() {
      if (points < 50) {
        numerador1 = Random().nextInt(20);
        numerador2 = Random().nextInt(20);
        denominador1 = Random().nextInt(20);
        denominador2 = Random().nextInt(20);
      } else if (points < 100) {
        numerador1 = Random().nextInt(100);
        numerador2 = Random().nextInt(100);
        denominador1 = Random().nextInt(20);
        denominador2 = Random().nextInt(20);
      } else {
        numerador1 = Random().nextInt(1000);
        numerador2 = Random().nextInt(1000);
        denominador1 = Random().nextInt(20);
        denominador2 = Random().nextInt(20);
      }
    });
  }

  void _startMultiplicationTimedFractionsGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
    progress.reset();

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

  void multiplyFractionsGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
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

    _numeradorController.clear();
    _denominadorController.clear();
    _generateNumbers(progress.pointsCount);
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
  void dispose() {
    _timer.cancel();
    _numeradorController.dispose();
    _denominadorController.dispose();
    super.dispose();
  }

  void _endGame() {
    _timer.cancel();
    setState(() {
      _result = "Tempo Esgotado!";
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<GameProgressController>(context, listen: false);

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              "Tempo: $_timeLeft s",
              style: TextStyle(fontSize: 26, color: Colors.red),
            ),
            SizedBox(height: 40),
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
                          _generateNumbers(progress.pointsCount);
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
