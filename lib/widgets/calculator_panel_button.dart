// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calc_gof/buttons.dart';
import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
import 'calculator_button.dart';

/// Panel what contains buttons what user can interact with
class CalcPanelButtons extends StatefulWidget {
  const CalcPanelButtons({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function(BValues) onTap;

  @override
  State<CalcPanelButtons> createState() => _CalcPanelButtonsState();
}

class _CalcPanelButtonsState extends State<CalcPanelButtons> {
  // late final Column _bodyPanel;

  // @override
  // void initState() {
  //   super.initState();
  //   _bodyPanel = _createBodyPanel();
  // }

  /// matrix with names(labels) of buttons what will be displayed on screen
  final List<List<BValues>> allButtons = [
    [
      // first row
      BValues.leftBracket,
      BValues.rightBracket,
      BValues.delOneChar,
      BValues.delAll
    ],
    [BValues.sevenInt, BValues.eightInt, BValues.nineInt, BValues.division],
    [BValues.fourInt, BValues.fiveInt, BValues.sixInt, BValues.multiplication],
    [BValues.oneInt, BValues.twoInt, BValues.threeInt, BValues.subtraction],
    [BValues.zeroInt, BValues.dot, BValues.equal, BValues.addition]
  ];

  /// method that creates a bodyPanel from [allButtons] matrix what passed by user
  // Column _createBodyPanel() {
  //   Column bodyPanel =

  //   //   return bodyPanel;
  //   // }
  //   return bodyPanel;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < allButtons.length; i++)
          Expanded(
            child: Row(
              children: [
                for (int j = 0; j < allButtons[i].length; j++)
                  Expanded(
                    flex: bRatio[allButtons[i][j]] ?? 1,
                    // if ratio is specified it will be chosen else default 1
                    child: CalculatorButton(
                      label: bSymbols[allButtons[i][j]]!,
                      onTap: () => widget.onTap(allButtons[i][j]),
                      backgroundColor:
                          bColors[allButtons[i][j]] ?? kButtonEvalColor,
                      // if color is specified it will be chosen else default
                      // kButtonEvalColor like the the most freequent
                    ),
                  )
              ],
            ),
          ),
      ],
    );
    // return _bodyPanel;
    // return Column(children: _bodyPanel
    // children: [
    //   Expanded(
    //     child: Row(
    //       children: [
    //         CalculatorButton(
    //           label: '(',
    //           onTap: () => onTap('('),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //         CalculatorButton(
    //           label: ')',
    //           onTap: () => onTap(')'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //         CalculatorButton(
    //           label: 'C',
    //           onTap: () => onTap('C'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //         CalculatorButton(
    //           label: 'AC',
    //           onTap: () => onTap('AC'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //       ],
    //     ),
    //   ),
    //   Expanded(
    //     child: Row(
    //       children: [
    //         CalculatorButton(label: '7', onTap: () => onTap('7')),
    //         CalculatorButton(label: '8', onTap: () => onTap('8')),
    //         CalculatorButton(
    //           label: '9',
    //           onTap: () => onTap('9'),
    //         ),
    //         CalculatorButton(
    //           label: '/',
    //           onTap: () => onTap('/'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //       ],
    //     ),
    //   ),
    //   Expanded(
    //     child: Row(
    //       children: [
    //         CalculatorButton(label: '4', onTap: () => onTap('4')),
    //         CalculatorButton(label: '5', onTap: () => onTap('5')),
    //         CalculatorButton(
    //           label: '6',
    //           onTap: () => onTap('6'),
    //         ),
    //         CalculatorButton(
    //           label: 'x',
    //           onTap: () => onTap('X'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //       ],
    //     ),
    //   ),
    //   Expanded(
    //     child: Row(
    //       children: [
    //         CalculatorButton(
    //           label: '1',
    //           onTap: () => onTap('1'),
    //         ),
    //         CalculatorButton(
    //           label: '2',
    //           onTap: () => onTap('2'),
    //         ),
    //         CalculatorButton(
    //           label: '3',
    //           onTap: () => onTap('3'),
    //         ),
    //         CalculatorButton(
    //           label: '-',
    //           onTap: () => onTap('-'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //       ],
    //     ),
    //   ),
    //   Expanded(
    //     child: Row(
    //       children: [
    //         CalculatorButton(
    //           label: '0',
    //           onTap: () => onTap('0'),
    //         ),
    //         CalculatorButton(
    //           label: '.',
    //           onTap: () => onTap('.'),
    //         ),
    //         CalculatorButton(
    //           label: '=',
    //           onTap: () => onTap('='),
    //           backgroundColor: kButtonEqualColor,
    //         ),
    //         CalculatorButton(
    //           label: '+',
    //           onTap: () => onTap('+'),
    //           backgroundColor: kButtonEvalColor,
    //         ),
    //       ],
    //     ),
    //   )
    // ],
    // );
  }
}
