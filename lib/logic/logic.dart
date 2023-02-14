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
  final List<BValues> _allPressedExpressionButtons = [];

  ///last inputed button
  // String _lastInputedButton = "";
  late BValues _lastInputedButton;

  set lastInputedButton(BValues userButton) {
    _lastInputedButton = userButton;
  }

  String get historyEvaluation {
    return _historyEvaluation;
  }

  String get currentStateEvaluation {
    return _currentStateEvaluation;
  }

  String? get lastSymbolCurrentEvaluation => currentStateEvaluation.isEmpty
      ? null
      : currentStateEvaluation[currentStateEvaluation.length - 1];

  /// methods what change the currentStateEvaluation
  /// +1 inputed symbol accordingly
  void _addSymbol(String symbol) {
    _allPressedExpressionButtons.add(_lastInputedButton);

    _currentStateEvaluation += symbol;
    // }
  }

  /// methods what change the currentStateEvaluation
  /// +1 inputed symbol accordingly
  void _delLastSymbol({bool canDeleteFromListButtons = true}) {
    if (_currentStateEvaluation.isNotEmpty) {
      int lengthDelete = bSymbols[_allPressedExpressionButtons.last]!.length;
      // count how many symbols weight last button (cos = 3), (+ = 1)
      _currentStateEvaluation = _currentStateEvaluation.substring(
          0, _currentStateEvaluation.length - lengthDelete);

      if (canDeleteFromListButtons) {
        // for instance (after u get answer u can't )
        _allPressedExpressionButtons.removeLast();
      }
      // TODO: fix error (not all buttons are pressed)
    }
  }

  /// delete all string(all computation)
  void _delAllSymbols() {
    _historyEvaluation = "";
    _currentStateEvaluation = '';
    // _currentResult = 0;
    _allPressedExpressionButtons.clear();
  }

  /// check wherether is this string a number

  _isNumeric(string) => num.tryParse(string) != null;

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

  ///Prepares res to beautiful string
  String _prepareRes(double res) {
    ///  reducing trailing '.0' if res is integer
    return res % 1 == 0.0 ? res.toInt().toString() : res.toString();
  }

  /// method what should be envolved when pressed "="
  void _pressedGetResult() {
    _historyEvaluation = '$_currentStateEvaluation=';
    _allPressedExpressionButtons.clear();
    _lastInputedButton = BValues.equal;
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
        if (currentStateEvaluation.isEmpty) {
          // do nothing
        } else if (!buttonsInt.contains(_lastInputedButton)) {
          // -, + *  etc.
        }
        //         else if (
        //         ){}
        // else if (){}
        else {
          // all forbidding conditions passed;
          continue add_element;
        }
        // otherwise do nothing
        break;
      case BValues.sin:
        _addSymbol(BValues.leftBracket);
        _addSymbol(BValues.sin);
      case BValues.cos:
        _addSymbol(BValues.leftBracket);
        _addSymbol(BValues.cos);
      case BValues.tg:
        _addSymbol(BValues.leftBracket);
        _addSymbol(BValues.sin);
      case BValues.addition:
        if (_) break;

      add_element:
      default:
        _lastInputedButton = buttonValue;
        _addSymbol(bSymbols[buttonValue]!);
        print(_allPressedExpressionButtons);
    }
  }
}
