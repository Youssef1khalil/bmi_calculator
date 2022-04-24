// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final IconData? icon;
  final String label;
  CardContent({this.icon, this.label = ''});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
