// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../calculate_bmi.dart';
import '../constants.dart';
import '../widgets/card_content.dart';
import '../widgets/navigator_button.dart';
import '../widgets/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(children: [
              ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                cardChild: CardContent(
                  icon: Icons.male,
                  label: 'Male',
                ),
                color: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
              ),
              ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: CardContent(
                  icon: Icons.female,
                  label: 'Female',
                ),
              ),
            ]),
          ),
          ReusableCard(
            onPress: () {},
            color: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumbStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      inactiveTrackColor: Color(0xff8d8e98),
                      overlayColor: Color(0x29eb1555),
                      thumbColor: Color(0xffeb1555),
                      activeTrackColor: Colors.white,
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      )),
                  child: Slider(
                      min: 120,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              ReusableCard(
                // onPress: () {},
                color: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumbStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                          iconData: Icons.remove,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                          iconData: Icons.add,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ReusableCard(
                // onPress: () {},
                color: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumbStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          iconData: Icons.remove,
                          onPress: () {
                            setState(() {
                              age > 10
                                  ? age--
                                  : Alert(
                                      style: AlertStyle(
                                        backgroundColor: Colors.white,
                                        // overlayColor: Colors.blue,
                                      ),
                                      context: context,
                                      title: 'Wrong age',
                                      desc: 'The Minimum age is 10',
                                      buttons: [
                                          DialogButton(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: Colors.blue,
                                          ),
                                        ]).show();
                            });
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          iconData: Icons.add,
                          onPress: () {
                            setState(() {
                              age < 100
                                  ? age++
                                  : Alert(
                                      style: AlertStyle(
                                        backgroundColor: Colors.white,
                                        // overlayColor: Colors.blue,
                                      ),
                                      context: context,
                                      title: 'Wrong age',
                                      desc: 'The Maximum age is 100',
                                      buttons: [
                                          DialogButton(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: Colors.blue,
                                          ),
                                        ]).show();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
          NavigatorButton(
            onPress: () {
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    bmiResults: calculatorBrain.calculateBMI(),
                    resultText: calculatorBrain.getResult(),
                    interpretation: calculatorBrain.getInterpretation(),
                  ),
                ),
              );
            },
            text: 'Calculate',
          )
        ],
      ),
    );
  }
}
