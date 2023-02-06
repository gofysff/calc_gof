// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calc_gof/buttons.dart';
import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
import 'calculator_button.dart';

/// Panel what contains buttons what user can interact with
class CalcPanelButtons extends StatefulWidget {
  CalcPanelButtons({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function(BValues) onTap;

  @override
  State<CalcPanelButtons> createState() => _CalcPanelButtonsState();
}

class _CalcPanelButtonsState extends State<CalcPanelButtons> {
  late final List<Expanded> _bodyPanel;

  @override
  void initState() {
    super.initState();
    _bodyPanel = _createBodyPanel();
  }

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
  List<Expanded> _createBodyPanel() {
    List<Expanded> bodyPanel = [];
    for (int i = 0; i < allButtons.length; i++) {
      bodyPanel.add(
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
      );
    }
    return bodyPanel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _bodyPanel);
  }
}
