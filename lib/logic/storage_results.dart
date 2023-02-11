import 'package:calc_gof/logic/buttons.dart';
import 'package:flutter/material.dart';

import 'logic.dart';

class StorageResults extends ChangeNotifier {
  static final Logic logic = Logic();

  String get historyEvaluation => logic.historyEvaluation;
  String get currentStateEvaluation => logic.currentStateEvaluation;

  void updateData(BValues pressedButton) {
    logic.updateCalculation(pressedButton);
    notifyListeners();
  }
}
