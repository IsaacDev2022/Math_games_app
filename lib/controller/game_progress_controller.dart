import 'package:flutter/cupertino.dart';

class GameProgressController extends ChangeNotifier {
  static final GameProgressController _instance = GameProgressController._internal();

  factory GameProgressController() => _instance;

  GameProgressController._internal();

  int additionPoints = 0;
  int subtractionPoints = 0;

  bool isAdditionSubtractUnlocked() => additionPoints >= 0;
  bool isSubtractUnlocked() => subtractionPoints >= 0;
}