import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

enum GenderName { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color _maleCardColor = kInactiveCardColor;
  Color _femaleCardColor = kInactiveCardColor;

  double _currentSliderValue = 180;
  int _weight = 60;
  int _age = 18;

  void _updateColor(GenderName gender) {
    _maleCardColor =
        (gender == GenderName.MALE) ? kActiveCardColor : kInactiveCardColor;
    _femaleCardColor =
        (gender == GenderName.FEMALE) ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: _maleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      description: "MALE",
                    ),
                    onPress: () {
                      setState(() {
                        _updateColor(GenderName.MALE);
                      });
                    },
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  color: _femaleCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    description: "FEMALE",
                  ),
                  onPress: () {
                    setState(() {
                      _updateColor(GenderName.FEMALE);
                    });
                  },
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _currentSliderValue.round().toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      trackHeight: 1.0,
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98)),
                  child: Slider(
                      value: _currentSliderValue,
                      min: 110,
                      max: 220,
                      divisions: 190,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            pressed: () {
                              setState(() {
                                _weight++;
                              });
                            },
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            pressed: () {
                              setState(() {
                                _weight--;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            pressed: () {
                              setState(() {
                                _age++;
                              });
                            },
                          ),
                          RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            pressed: () {
                              setState(() {
                                _age--;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Container(
            color: kButtonColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
            child: FlatButton(onPressed: () {}, child: Text("CALCULATE BMI")),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.pressed});

  final IconData iconData;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      splashColor: Colors.red,
      disabledElevation: 6.0,
      onPressed: pressed,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      child: Icon(
        iconData,
        size: 20.0,
      ),
    );
  }
}
