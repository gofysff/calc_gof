// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:calc_gof/constants/constant_colors.dart';
import 'package:calc_gof/buttons.dart';
import 'package:calc_gof/logic.dart';
import 'package:flutter/material.dart';

import '../widgets/calculator_panel_button.dart';
import '../widgets/gradient_line.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mainLogic = Logic();

  void updateCalculation(BValues buttonValue) {
    mainLogic.updateCalculation(buttonValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox(width: double.infinity),
                  Text(mainLogic.historyEvaluation,
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 24),
                      textAlign: TextAlign.end),
                  Text(mainLogic.currentStateEvaluation,
                      style: const TextStyle(color: Colors.white, fontSize: 34),
                      textAlign: TextAlign.end),
                ],
              ),
            ),
          ),
          const GradientLine(height: 10),

          //! Main field with buttons
          Expanded(
            //TODO: ADD real functionality
            flex: 5,
            child: CalcPanelButtons(onTap: updateCalculation),
          ),
        ],
      ),
    );
  }
}
