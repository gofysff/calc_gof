import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.backgroundColor = kBackgroundColor,
      this.labelColor = kTextColor,
      this.fontSize = 30,
      required this.paddingSize});

  final String label;
  final VoidCallback onTap;
  final double fontSize;
  final double paddingSize;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: kShadowColor, offset: Offset(2.5, 2.5), blurRadius: 2),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: backgroundColor,
        ),
        child: MaterialButton(
            elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: onTap,
          color: backgroundColor,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: labelColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
