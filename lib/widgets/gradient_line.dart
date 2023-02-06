// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calc_gof/constants/constant_colors.dart';
import 'package:flutter/material.dart';

/// Empty purple line with chosable height

class GradientLine extends StatelessWidget {
  final double? height;
  const GradientLine({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kGradientColor1, kGradientColor2, kGradientColor3],
        ),
      ),
    );
  }
}
