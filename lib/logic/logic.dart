import 'package:calc_gof/logic/buttons.dart';
import 'package:math_parser/math_parser.dart';
import 'dart:math';
import '../constants/constant_messages.dart';

/// main class for all logic of our calculator
class Logic {
  /// contain last result of the calculation
  /// or the chain of symbols what was inputted by user before he putted the result button

  /// string what represents the last result of the calculation
  String _historyEvaluation = "";

  /// flag that last button was [BValues.equal]
  bool _isLastButtonEqual = false;

  /// flag indicating that we got error during calculation
  bool _getError = false;

  /// temporary list what contains results of the calculation
  final List<BValues> _tempResultsStorage = [];

  /// contains all buttons user pressed
  ///
  /// it used for calculating the result
  final List<BValues> _expressionInButtons = [];

  BValues? get lastInputedButton =>
      _expressionInButtons.isEmpty ? null : _expressionInButtons.last;

  /// string what represents the last result of the calculation

  String get historyEvaluation => _isLastButtonEqual ? _historyEvaluation : "";

  /// Get the string representation of expression from
  // String get currentStateEvaluation => _getError == false
  //     ? [for (var el in _expressionInButtons) el.toStringg()].join()
  //     : kMessageError;

  String get currentStateEvaluation {
    if (_getError == true) {
      return kMessageError;
    } else if (_isLastButtonEqual) {
      return [for (var el in _tempResultsStorage) el.toStringg()].join();
    } else {
      return [for (var el in _expressionInButtons) el.toStringg()].join();
    }
  }

  BValues? get lastButton =>
      _expressionInButtons.isNotEmpty ? _expressionInButtons.last : null;

  /// methods what add pressed button to the [expressionInButtons]
  void _addSymbol(BValues button) {
    _expressionInButtons.add(button);
  }

  /// methods what change the currentStateEvaluation
  /// +1 inputed symbol accordingly
  void _delLastSymbol() {
    if (_expressionInButtons.isNotEmpty) {
      _expressionInButtons.removeLast();
    } else {
      // we delete and history expression also
      _delAllSymbols();
    }
  }

  /// delete all string(all computation)
  void _delAllSymbols() => _expressionInButtons.clear();

  /// check wherether is this string a number

  _isNumeric(string) => num.tryParse(string) != null;

  bool _canPutDot() {
    if (_expressionInButtons.isEmpty) {
      return false;
    } else if (lastButton!.isNotInt) {
      return false;
    }

    int counterDots = 0;
    for (int i = _expressionInButtons.length - 1; i >= 0; i--) {
      if (_expressionInButtons[i] == BValues.dot) {
        counterDots += 1;
      } else if (_expressionInButtons[i].isNotInt) {
        break;
      }
    }
    if (counterDots == 1) {
      // we met dot in the number what we get from slice of buttons
      return false;
    }

    return true;
  }

  /// Prepare the expression by replacing user symbols with their corresponding analogue
  String _prepareExpressionToEval(String expression) {
    return expression
        .toLowerCase()
        .replaceAll(BValues.multiplication.toStringg(), '*')
        .replaceAll(BValues.sqrt.toStringg(), 'sqrt');
  }

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

  /// Returns null if [_expressionInButtons] is empty
  /// else returns result of checking
  bool? _isLastButtonArifmetic(BValues button) => lastButton != null
      ? [
          BValues.addition,
          BValues.subtraction,
          BValues.multiplication,
          BValues.division
        ].contains(lastButton)
      : null;

  ///Prepares res to beautiful string
  String _prepareRes(double res) {
    // TODO: make rounding
    // TODO: add E format
    ///  reducing trailing '.0' if res is integer
    return res % 1 == 0.0 ? res.toInt().toString() : res.toString();
  }

  /// method what should be envolved when pressed "="
  void _pressedGetResult() {
    _historyEvaluation = '$currentStateEvaluation=';

    var result = evaluate(currentStateEvaluation);
    _expressionInButtons.clear();
    if (_isNumeric(result)) {
      _tempResultsStorage.addAll(convertResToButtons(result));
    } else {
      _getError = true;
    }
  }

  /// getting information about last calculation result
  /// and writing to the main storage for expression[_expressionInButtons]
  void _getInfoFromSTempStorage() =>
      _expressionInButtons.addAll(_tempResultsStorage);

  /// call after any pressed button except [BValues.equal]
  void _resetAll() {
    _isLastButtonEqual = false;
    _getError = false;
    _tempResultsStorage.clear();
  }

  /// function what perform computation
  ///
  /// only computation!
  String evaluate(String expression) {
    expression = _prepareExpressionToEval(expression);
    try {
      final expr = MathNodeExpression.fromString(expression).calc(
        MathVariableValues({
          BValues.piConstant.toStringg(): pi,
          BValues.eConstant.toStringg(): e
        }),
      );
      return expr.toString();
    } catch (error) {
      print('exception is $error');
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
        _isLastButtonEqual = true;

        break;
      case BValues.dot:
        if (_expressionInButtons.isNotEmpty) {
          if (_canPutDot()) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.sin:
        _addSymbol(buttonValue);
        _addSymbol(BValues.leftBracket);
        break;
      case BValues.cos:
        _addSymbol(buttonValue);
        _addSymbol(BValues.leftBracket);
        break;
      case BValues.tg:
        _addSymbol(buttonValue);
        _addSymbol(BValues.leftBracket);
        break;
      case BValues.addition:
        _getInfoFromSTempStorage();
        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.multiplication:
        _getInfoFromSTempStorage();

        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.division:
        _getInfoFromSTempStorage();

        bool? check = _isLastButtonArifmetic(buttonValue);
        // add only if this isn't the first symbol and previous was not the arifmetic
        if (check != null) {
          if (!check) {
            _addSymbol(buttonValue);
          }
        }
        break;
      case BValues.subtraction:
        _getInfoFromSTempStorage();

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

    if (buttonValue != BValues.equal) {
      _resetAll();
    }
  }
}
