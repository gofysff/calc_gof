import 'package:calc_gof/logic/buttons.dart';
import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
import 'calculator_button.dart';

/// Panel what contains buttons what user can interact with
class CalcPanelButtons extends StatefulWidget {
  const CalcPanelButtons({
    Key? key,
    required this.onTap,
    this.isIncludeTrigonometry = false,
  }) : super(key: key);

  final void Function(BValues) onTap;
  final bool isIncludeTrigonometry;

  static const List<List<BValues>> withoutTrigonometry = [
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

  static const List<List<BValues>> withTrigonometry = [
    [BValues.lg, BValues.ln, BValues.tg, BValues.sin, BValues.cos],
    [
      BValues.power,
      BValues.leftBracket,
      BValues.rightBracket,
      BValues.delOneChar,
      BValues.delAll
    ],
    [
      BValues.tenPow,
      BValues.sevenInt,
      BValues.eightInt,
      BValues.nineInt,
      BValues.division
    ],
    [
      BValues.sqrt,
      BValues.fourInt,
      BValues.fiveInt,
      BValues.sixInt,
      BValues.multiplication
    ],
    [
      BValues.piConstant,
      BValues.oneInt,
      BValues.twoInt,
      BValues.threeInt,
      BValues.subtraction
    ],
    [
      BValues.eConstant,
      BValues.zeroInt,
      BValues.dot,
      BValues.equal,
      BValues.addition
    ]
  ];
  @override
  State<CalcPanelButtons> createState() => _CalcPanelButtonsState();
}

class _CalcPanelButtonsState extends State<CalcPanelButtons> {
  /// matrix with names(labels) of buttons what will be displayed on screen
  late List<List<BValues>> allButtons;

  late bool isIncludeTrigonometry;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isIncludeTrigonometry = widget.isIncludeTrigonometry;

    allButtons = isIncludeTrigonometry
        ? CalcPanelButtons.withTrigonometry
        : CalcPanelButtons.withoutTrigonometry;
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
                      paddingSize: isIncludeTrigonometry ? 6 : 9,
                      fontSize: isIncludeTrigonometry ? 20 : 30,
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
  }
}
