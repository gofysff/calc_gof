import 'package:flutter/material.dart';
// import 'package:calc_gof/buttons.dart';
import '../constants/constant_colors.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = kBackgroundColor,
      this.labelColor = kTextColor});

  final String label;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            // width: size,
            // height: size,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: kButtonNumberColor,
                      offset: Offset(1, 1),
                      blurRadius: 2),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: backgroundColor),
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: labelColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
