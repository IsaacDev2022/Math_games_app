import 'package:flutter/cupertino.dart';

class GameProgressController extends ChangeNotifier {
  int pointsCount = 1200;

  void addPoints(int points) {
    pointsCount += points;
    notifyListeners();
  }

  void reset() {
    pointsCount = 0;
    notifyListeners();
  }

  // Jogos por Pontos
  bool isAdditionUnlocked() => pointsCount >= 50;
  bool isSubtractUnlocked() => pointsCount >= 100;
  bool isMultiplicationUnlocked() => pointsCount >= 150;
  bool isDivideUnlocked() => pointsCount >= 200;
  bool isPotentiationUnlocked() => pointsCount >= 300;
  bool isRootingUnlocked() => pointsCount >= 400;
  bool isAdditionFractionUnlocked() => pointsCount >= 0;
  bool isSubtractFractionUnlocked() => pointsCount >= 600;
  bool isMultiplicationFractionUnlocked() => pointsCount >= 800;
  bool isDivideFractionUnlocked() => pointsCount >= 1000;

  // Jogos por Tempo
  bool isAdditionTimedUnlocked() => pointsCount >= 1050;
  bool isSubtractTimedUnlocked() => pointsCount >= 1100;
  bool isMultiplicationTimedUnlocked() => pointsCount >= 1200;
  bool isDivideTimedUnlocked() => pointsCount >= 1300;

}