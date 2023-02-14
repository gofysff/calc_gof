import 'package:math_expressions/math_expressions.dart';
import 'package:calc_gof/logic/buttons.dart';

import '../constants/constant_messages.dart';

/// main class for all logic of our calculator

class Logic {
  /// TODO: avoid from ising string like main thing
  /// contain last result of the calculation
  /// or the chain of symbols what was inputted by user before he putted the result button
  String _historyEvaluation = "";

  /// current state eval using for intermediate panel with text
  ///
  /// what also show result after evaluation
  String _currentStateEvaluation = "";

  /// contains all buttons user pressed
  ///
  /// it used for calculating the result
  final List<BValues> _expressionInButtons = [];

  ///last inputed button
  // String _lastInputedButton = "";

  BValues? get lastInputedButton =>
      _expressionInButtons.isEmpty ? null : _expressionInButtons.last;

  String get historyEvaluation {
    return _historyEvaluation;
  }

  /// Get the string representation of expression from
  String get currentStateEvaluation =>
      [for (var el in _expressionInButtons) el.toStringg()].join();

  BValues? get lastButton =>
      _expressionInButtons.isNotEmpty ? _expressionInButtons.last : null;

  /// methods what add pressed button to the [expressionInButtons]
  void _addSymbol(BValues button) => _expressionInButtons.add(button);

  /// methods what change the currentStateEvaluation
  /// +1 inputed symbol accordingly
  void _delLastSymbol() {
    if (_expressionInButtons.isNotEmpty) {
      _expressionInButtons.removeLast();
    } else {
      // we delete and history expression also
      _delLastSymbol();
    }
  }

  /// delete all string(all computation)
  void _delAllSymbols() {
    _historyEvaluation = "";

    _expressionInButtons.clear();
  }

  /// check wherether is this string a number

  _isNumeric(string) => num.tryParse(string) != null;

  bool _canPutDot() {
    if (_expressionInButtons.isEmpty) {
      return false;
    }
    //  else if () {
    //TODO: complete this thing
    // }
    return true;
  }

  /// Prepare the expression by replacing user symbols with their corresponding analogue
  String _prepareExpressionToEval(String expression) {
    return expression
        .toLowerCase()
        .replaceAll(bSymbols[BValues.multiplication]!, '*');
  }

  //TODO:
  List<BValues> convertResToButtons(String res) {
    List<BValues> result = [];
    if (_isNumeric(res)) {
      // swap keys and values in bSymbols
      Map<String, BValues> swappedBSymbols = {};
      bSymbols.forEach((key, value) {
        swappedBSymbols[value] = key;
      });
      res.split("").forEach((element) {
        result.add(swappedBSymbols[element]!);
      });
    }
    return result;
  }

  //TODO:

  /// Returns null if [_expressionInButtons] is empty
  /// else returns result of checking
  bool? _isLastButtonArifmetic(BValues button) => lastButton != null
      ? [
          BValues.addition,
          BValues.subtraction,
          BValues.multiplication,
          BValues.division
        ].contains(button)
      : null;

  ///Prepares res to beautiful string
  String _prepareRes(double res) {
    ///  reducing trailing '.0' if res is integer
    return res % 1 == 0.0 ? res.toInt().toString() : res.toString();
  }

  /// method what should be envolved when pressed "="
  void _pressedGetResult() {
    // TODO: переработать полностью метод, добавив новый парсер
    _historyEvaluation = '$_currentStateEvaluation=';
    _expressionInButtons.clear();
    // _lastInputedButton = BValues.equal;
    //Todo: какая-то хуйня все сломало, но надо использовать другой парсер
    // TODO: add here convertaion [allPressedExpressionButtons] to string and pass it to evaluate func

    _currentStateEvaluation = evaluate(_currentStateEvaluation);
    if (_isNumeric(_currentStateEvaluation)) {
      // TODO: make convert function (string to buttons)
    }
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
      return kMessageError;
    }
  }

  /// metod to regulate interaction with user
  ///
  /// function input is button what user pressed
  void updateCalculation(BValues buttonValue) {
    // print(bSymbols[buttonValue]);
    switch (buttonValue) {
      case BValues.delOneChar:
        _delLastSymbol();
        break;
      case BValues.delAll:
        _delAllSymbols();
        break;
      case BValues.equal:
        _pressedGetResult();
        break;
      case BValues.dot:
        if (_expressionInButtons.isEmpty) {}
        //   //TODO: refactor this also
        break;
      case BValues.sin:
        _addSymbol(BValues.leftBracket);
        _addSymbol(buttonValue);
        break;
      case BValues.cos:
        _addSymbol(BValues.leftBracket);
        _addSymbol(buttonValue);
        break;
      case BValues.tg:
        _addSymbol(BValues.leftBracket);
        _addSymbol(buttonValue);
        break;
      case BValues.addition:
        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.multiplication:
        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.division:
        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.subtraction:
        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        } else {
          _addSymbol(buttonValue);
        }
        break;
      default:
        _addSymbol(buttonValue);
      // print(_expressionInButtons);
    }
  }
}
