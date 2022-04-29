// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import '../widgets/navigator_button.dart';

class Results extends StatelessWidget {
  Results(
      {required this.bmiResults,
      required this.resultText,
      required this.interpretation});

  final String bmiResults;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kInactiveCardColor,
        title: Text(
          'BMI Calculator',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTittleStyle,
              ),
            ),
          ),
          ReusableCard(
            flexNumb: 5,
            color: kActiveCardColor,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resultText.toUpperCase(),
                  style: kResultTextStyle,
                ),
                Text(
                  bmiResults,
                  style: kBmiTextStyle,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                )
              ],
            ),
          ),
          NavigatorButton(
            onPress: () {
              Navigator.pop(context);
            },
            text: 'Re-Calculate',
          ),
        ],
      ),
    );
  }
}
