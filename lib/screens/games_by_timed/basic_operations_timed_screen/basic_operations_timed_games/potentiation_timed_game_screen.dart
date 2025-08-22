import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/game_progress_controller.dart';

class PotentiationTimedGameScreen extends StatefulWidget {
  const PotentiationTimedGameScreen({super.key});

  @override
  State<PotentiationTimedGameScreen> createState() => _PotentiationTimedGameScreenState();
}

class _PotentiationTimedGameScreenState extends State<PotentiationTimedGameScreen> {
  final TextEditingController _addController = TextEditingController();
  String _result = "";

  late Timer _timer;
  int _timeLeft = 60;

  var base = Random().nextInt(20);
  var exponent = Random().nextInt(10);
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
        base = Random().nextInt(20);
        exponent = Random().nextInt(10);
      } else if (points < 100) {
        base = Random().nextInt(20);
        exponent = Random().nextInt(10);
      } else {
        base = Random().nextInt(20);
        exponent = Random().nextInt(10);
      }
    });
  }

  void addNumbersGame() {
    final progress = Provider.of<GameProgressController>(context, listen: false);
    final String somaText = _addController.text;
    final int add = int.tryParse(somaText) ?? 0;

    if (add == powNumbers(base, exponent)) {
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

  int powNumbers(int num1, int num2) {
    return num1 + num2;
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
                "${base} ^ ${exponent} = ?",
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
