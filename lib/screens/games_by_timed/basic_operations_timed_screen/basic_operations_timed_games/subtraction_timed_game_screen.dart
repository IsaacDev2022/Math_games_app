import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';

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

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
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

  void _endGame() {
    _timer.cancel();
    setState(() {
      _result = "⏰ Tempo Esgotado!";
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

  void addNumbersGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
    final String somaText = _addController.text;
    final int add = int.tryParse(somaText) ?? 0;

    if (add == subNumbers(number1, number2)) {
      hits += 1;
      setState(() {
        _result = "CORRETO ✅";
        progress.addPoints(10);
        _timeLeft += 10; // bônus de tempo
      });
    } else {
      errors += 1;
      setState(() {
        _result = "ERRADO ❌";
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Pontuação: ${progress.pointsCount}",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "⏳ Tempo: $_timeLeft s",
                style: TextStyle(fontSize: 26, color: Colors.red),
              ),
              SizedBox(height: 40),
              Text(
                "${number1} - ${number2} = ?",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _addController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _timeLeft > 0 ? addNumbersGame : null,
                child: Text("Verificar"),
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  _result,
                  style: TextStyle(fontSize: 22),
                ),
              Spacer(),
              if (_timeLeft == 0)
                Column(
                  children: [
                    Text(
                      "Fim do Jogo!",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text("✅ Acertos: $hits   ❌ Erros: $errors",
                        style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hits = 0;
                          errors = 0;
                          _result = "";
                          _startGame();
                        });
                      },
                      child: Text("Jogar Novamente"),
                    ),
                  ],
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
