import 'package:test/test.dart';
import 'dart:math';
import 'package:math_parser/math_parser.dart';

void main() {
  test('const pi works fine', () {
    expect((pi.toString()), equals(pi.toString()));

    // expect(lg.evaluate('pi*7'), equals((pi * 7).toString()));

    final expression = MathNodeExpression.fromString(
      'pi*7',
    ).calc(
      const MathVariableValues({'pi': pi}),
    );
    expect(expression.toString(), equals((pi * 7).toString()));

    // expect(lg.evaluate(pi.toString() * 7), equals('22'));
  });

  // test('0.1+0.2', () {
  //   expect((pi.toString()), equals(pi.toString()));

  //   expect(lg.evaluate('pi*7'), equals((pi * 7).toString()));

  //   // final expression = MathNodeExpression.fromString(
  //   //   '0.1*7',
  //   // ).calc(MathVariableValues.none);
  //   // expect(expression.toString(), equals(0.7.toString()));

  //   // expect(lg.evaluate(pi.toString() * 7), equals('22'));
  // });

  // expect(expression, equals((pi * 7).toString()));

  // test('check', () {
  //   expect(lg.addSymbol('5'), expect(lg.currentStateEvaluation));
  // });
}
