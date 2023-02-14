import 'package:calc_gof/logic/buttons.dart';
import 'package:flutter/material.dart';

import 'logic.dart';

/// statemanagement class what let change values what i want
class StorageResults extends ChangeNotifier {
  static final Logic logic = Logic();
  bool _isIncludeTrigonometry = false;

  String get historyEvaluation => logic.historyEvaluation;
  String get currentStateEvaluation => logic.currentStateEvaluation;
  bool get isIncludeTrigonometry => _isIncludeTrigonometry;

  /// Update information after user press on the button from calculation panel
  void updateData(BValues pressedButton) {
    logic.updateCalculation(pressedButton);
    notifyListeners();
  }

  /// let the change panel to trigonomic if it was not already
  /// or not trigonomic if it was already trigonomic
  void changeButtonPanel() {
    _isIncludeTrigonometry = !_isIncludeTrigonometry;
    // if it is not included then it has to be included
    // if it is analogic
    notifyListeners();
  }
}
