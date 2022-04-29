// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../constants.dart';

class NavigatorButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  NavigatorButton({required this.text, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(text, style: kNavigatorButton),
        ),
        padding: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
