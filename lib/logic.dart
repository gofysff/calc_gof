import 'package:math_expressions/math_expressions.dart';
import 'package:calc_gof/buttons.dart';

/// main class for all logic of our calculator

class Logic {
  /// contain last result of the calculation
  /// or the chain of symbols what was inputted by user before he putted the result button
  String _historyEvaluation = "";

  /// current state eval using for intermediate panel with text
  ///
  /// what also show result after evaluation
  String _currentStateEvaluation = "";

  // /// result what can be used for next evaluation
  // double _currentResult = 0;

  ///last inputed button
  // String _lastInputedButton = "";
  late BValues _lastInputedButton;

  bool _isDotPressed = false;

  set lastInputedButton(BValues userButton) {
    _lastInputedButton = userButton;
  }

  String get historyEvaluation {
    return _historyEvaluation;
  }

  String get currentStateEvaluation {
    return _currentStateEvaluation;
  }

  /// methods what change the currentStateEvaluation
  /// +1 inputed symbol accordingly
  void _addSymbol(String symbol) {
    if (_isNeededContinueComputation() == false) {
      _historyEvaluation += _currentStateEvaluation;
      _currentStateEvaluation += symbol;
    } else {
      _currentStateEvaluation += bSymbols[_lastInputedButton]!;
    }
  }

  /// methods what change the currentStateEvaluation
  /// +1 inputed symbol accordingly
  void _delLastSymbol() {
    if (_currentStateEvaluation.length > 1) {
      //! probably here could be mistake
      if (_currentStateEvaluation[_currentStateEvaluation.length - 1] ==
          bSymbols[BValues.dot]) {
        // deleting dot symbol
        _isDotPressed = false;
      }
      _currentStateEvaluation = _currentStateEvaluation.substring(
          0, _currentStateEvaluation.length - 2);
    }
  }

  /// delete all string(all computation)
  void _delAllSymbols() {
    _historyEvaluation = "";
    _isDotPressed = false;
    _currentStateEvaluation = '';
    // _currentResult = 0;
  }

  /// check wherether is this string a number
  _isNumeric(string) => num.tryParse(string) != null;

  ///check whether we need to computate with last result
  ///
  /// Example: last user exercise: 5+7=12 - now we can continue with result
  ///
  /// like: *7=84
  bool _isNeededContinueComputation() {
    if (!_isNumeric(_currentStateEvaluation)) {
      // currentStateEvaluation isn't numeric (we computated nothing)
      return false;
    } else if ([
      BValues.addition,
      BValues.division,
      BValues.multiplication,
      BValues.subtraction
    ].contains(_lastInputedButton)) {
      return true;
      // user inputed arifmetic action and in this time on main screen displaying result of last computation
    } else {
      return true;
    }
  }

  /// Prepare the expression by replacing user symbols with their corresponding analogue
  String _prepareExpressionToEval(String expression) {
    return expression
        .toLowerCase()
        .replaceAll(bSymbols[BValues.multiplication]!, '*');
  }

  ///Prepares res to beautiful string
  String _prepareRes(double res) {
    ///  reducing trailing '.0' if res is integer
    return res % 1 == 0.0 ? res.toInt().toString() : res.toString();
  }

  /// method what should be envolved when pressed "="
  void _pressedGetResult() {
    _historyEvaluation = '$_currentStateEvaluation=';
    _currentStateEvaluation = evaluate(_currentStateEvaluation);
  }

  /// function what perform computation
  ///
  /// only computation!
  String evaluate(String expression) {
    String express = _prepareExpressionToEval(expression);
    try {
      Expression expParsed = Parser().parse(express);

      double resEvaluated =
          expParsed.evaluate(EvaluationType.REAL, ContextModel());

      return _prepareRes(resEvaluated);
    } catch (e) {
      print('exception is $e');
      return 'Ошибка';
    }
  }

  /// metod to regulate interaction with user
  ///
  /// function input is button what user pressed
  void updateCalculation(BValues buttonValue) {
    _lastInputedButton = buttonValue;
    // print(buttonValue);
    if (buttonValue == BValues.delOneChar) {
      _delLastSymbol();
    } else if (buttonValue == BValues.delAll) {
      _delAllSymbols();
    } else if (buttonValue == BValues.equal) {
      _pressedGetResult();
    } else if (buttonValue == BValues.dot) {
      if (_isDotPressed == false) {
        _addSymbol(bSymbols[BValues.dot]!);
        // otherwise do nothing
      } else {
        _addSymbol(bSymbols[buttonValue]!);
      }
    }
  }
}
