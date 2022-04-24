// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  Function() onPress;
  RoundIconButton({required this.iconData, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 5,
      child: Icon(iconData),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
    );
  }
}
