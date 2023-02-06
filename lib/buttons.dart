import 'dart:ui';

import 'constants/constant_colors.dart';

/// Show what action user choose (what button pressed)
enum BValues {
  multiplication,
  division,
  addition,
  subtraction,
  equal,
  dot,
  leftBracket,
  rightBracket,
  zeroInt,
  oneInt,
  twoInt,
  threeInt,
  fourInt,
  fiveInt,
  sixInt,
  sevenInt,
  eightInt,
  nineInt,
  delOneChar,
  delAll,
  sin,
  cos,
  tg,
  ln,
  lg,
  power,
  piConstant,
  eConstant,
  ePow,
  tenPow,
}

/// Match buttonName [BValues] and symbols what will be displayed on screen
Map<BValues, String> bSymbols = {
  BValues.multiplication: '\u{00D7}',
  BValues.addition: '+',
  BValues.subtraction: '-',
  BValues.division: '/',
  BValues.equal: '=',
  BValues.dot: '.',
  BValues.cos: 'cos(',
  BValues.sin: 'sin(',
  BValues.tg: 'tg(',
  BValues.ln: 'ln(',
  BValues.lg: 'lg(',
  BValues.delOneChar: '\u{232B}',
  BValues.delAll: '\u{2421}',
  BValues.leftBracket: '(',
  BValues.rightBracket: ')',
  BValues.piConstant: '\u{03C0}',
  BValues.eConstant: 'e',
  BValues.zeroInt: '0',
  BValues.power: '^',
  BValues.oneInt: '1',
  BValues.twoInt: '2',
  BValues.threeInt: '3',
  BValues.fourInt: '4',
  BValues.fiveInt: '5',
  BValues.sixInt: '6',
  BValues.sevenInt: '7',
  BValues.eightInt: '8',
  BValues.nineInt: '9',
  BValues.tenPow: '10^',
  BValues.ePow: 'e^',
};

/// Match buttonName [BValues] and colors what will be displayed on screen
///
/// if color is not specified then it will be default [kButtonEvalColor]
Map<BValues, Color> bColors = {
  BValues.equal: kButtonEqualColor,
  BValues.oneInt: kButtonNumberColor,
  BValues.twoInt: kButtonNumberColor,
  BValues.threeInt: kButtonNumberColor,
  BValues.fourInt: kButtonNumberColor,
  BValues.fiveInt: kButtonNumberColor,
  BValues.sixInt: kButtonNumberColor,
  BValues.sevenInt: kButtonNumberColor,
  BValues.eightInt: kButtonNumberColor,
  BValues.nineInt: kButtonNumberColor,
  BValues.tenPow: kButtonNumberColor,
  BValues.ePow: kButtonNumberColor,
};

/// Match buttonName [BValues] and ratio(flex) for specific button in row
///
/// by default is 1
Map<BValues, int> bRatio = {};
