import 'package:calc_gof/logic/buttons.dart';
import 'package:math_parser/math_parser.dart';
import 'package:test/test.dart';
import 'package:calc_gof/logic/logic.dart';
import 'dart:math';

void main() {
  Logic lg = Logic();

  group('Simple computations', () {
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

    test('0.1+2', () {
      expect((pi.toString()), equals(pi.toString()));

      // expect(lg.evaluate('pi*7'), equals((pi * 7).toString()));

      final expression = MathNodeExpression.fromString(
        '0.1+2',
      ).calc(MathVariableValues.none);
      expect(expression.toString(), equals(2.1.toString()));

      // expect(lg.evaluate(pi.toString() * 7), equals('22'));
    });

    test('0.1*7', () {
      expect((pi.toString()), equals(pi.toString()));

      // expect(lg.evaluate('pi*7'), equals((pi * 7).toString()));

      expect(lg.evaluate('0.1*7'), equals('0.7'));
    });

    test(
      '(5-3)x76 == 152',
      () {
        expect(lg.evaluate('(5-3)x76'), equals('152'));
      },
    );

    test(
      '(sin(5) works fine',
      () {
        expect(lg.evaluate('sin(5)'), equals(sin(5).toString()));
      },
    );

    test(
      '(cos(5) works fine',
      () {
        expect(lg.evaluate('cos(5)'), equals(cos(5).toString()));
      },
    );

    // test(
    //   '(tg(5) works fine',
    //   () {
    //     expect(lg.evaluate('tg(5)'), equals(tan(5).toString()));
    //   },
    // );

    test(
      '(tan(5) works fine',
      () {
        expect(lg.evaluate('tan(5)'), equals(tan(5).toString()));
      },
    );

    // test(
    //   'const pi works fine',
    //   () {
    //     expect(lg.evaluate(pi.toString()), equals(pi.toString()));

    //     expect(lg.evaluate('pi*7'), equals((pi * 7).toString()));

    //     // expect(lg.evaluate(pi.toString() * 7), equals('22'));
    //   },
    // );
    test(
      '(7-5*2)/2 == -1.5',
      () {
        expect(lg.evaluate('(7-5*2)/2'), '-1.5');
      },
    );
  });

  // test('check', () {
  //   expect(lg.addSymbol('5'), expect(lg.currentStateEvaluation));
  // });
}
