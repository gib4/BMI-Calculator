import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  MALE,
  FEMALE,
  NOT_SELECTED,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kUncheckedContainerColor;
  Color femaleCardColor = kUncheckedContainerColor;

  int height = 180;
  int age = 65;
  int weight = 60;
  Gender _selectedGender = Gender.NOT_SELECTED;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          print('Male card was pressed');
                          setState(() {
                            _selectedGender = Gender.MALE;
                          });
                        },
                        colour: _selectedGender == Gender.MALE
                            ? kCheckedContainerColor
                            : kUncheckedContainerColor,
                        cardChild: IconContent(
                            label: 'MALE', icon: FontAwesomeIcons.mars),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          print('Female card was pressed');
                          setState(() {
                            _selectedGender = Gender.FEMALE;
                          });
                        },
                        colour: _selectedGender == Gender.FEMALE
                            ? kCheckedContainerColor
                            : kUncheckedContainerColor,
                        cardChild: IconContent(
                            label: 'FEMALE', icon: FontAwesomeIcons.venus),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kUncheckedContainerColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ]),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          disabledInactiveTrackColor: kInactiveSliderColor,
                          activeTrackColor: kActiveSliderColor,
                          overlayColor: kOverlaySliderColor,
                          thumbColor: kSliderThumbColor,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          divisions: 100,
                          //label: currentSliderValue.round().toString(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          colour: kUncheckedContainerColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Text(
                                    'kg',
                                    style: kLabelTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    buttonColor: kButtonColor,
                                    selectedIcon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        print("Minus");
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    buttonColor: kButtonColor,
                                    selectedIcon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        print("Plus");
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Expanded(
                      child: ReusableCard(
                          colour: kUncheckedContainerColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    age.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    buttonColor: kButtonColor,
                                    selectedIcon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        print("Minus");
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    buttonColor: kButtonColor,
                                    selectedIcon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        print("Plus");
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          resultText: calc.getResult(),
                        ),
                      ));
                },
              ),
            ]),
      ),
    );
  }
}



class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0), // in pixels
        ),
      ),
    );
  }
}
