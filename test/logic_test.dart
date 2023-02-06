import 'package:test/test.dart';
import 'package:calc_gof/logic.dart';

void main() {
  Logic lg = Logic();

  group('Simple computations', () {
    test(
      '(5-3)x76 == 152',
      () {
        expect(lg.evaluate('(5-3)x76'), equals('152'));
      },
    );

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
