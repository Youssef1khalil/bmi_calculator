// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.flexNumb = 1,
      required this.color,
      required this.cardChild,
      this.onPress});
  final int flexNumb;
  final Color color;
  final Widget cardChild;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexNumb,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
