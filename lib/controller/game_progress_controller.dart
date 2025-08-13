import 'package:flutter/cupertino.dart';

class GameProgressController extends ChangeNotifier {
  int pointsCount = 500;

  void addPoints(int points) {
    pointsCount += points;
    notifyListeners();
  }

  bool isAdditionUnlocked() => pointsCount >= 50;
  bool isSubtractUnlocked() => pointsCount >= 100;
  bool isMultiplicationUnlocked() => pointsCount >= 150;
  bool isDivideUnlocked() => pointsCount >= 200;
  bool isPotentiationUnlocked() => pointsCount >= 300;
  bool isRootingUnlocked() => pointsCount >= 400;
}