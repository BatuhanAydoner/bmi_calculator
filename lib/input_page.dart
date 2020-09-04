import 'package:flutter/material.dart';
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

  double _currentSliderValue = 170;

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                  ),
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
                Slider(
                    inactiveColor: Color(0xFF8D8E98),
                    activeColor: Colors.red,
                    value: _currentSliderValue,
                    min: 10,
                    max: 200,
                    divisions: 190,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    })
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(color: kActiveCardColor)),
                Expanded(child: ReusableCard(color: kActiveCardColor)),
              ],
            ),
          ),
          Container(
            color: kButtonColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
            child: FlatButton(onPressed: () {}, child: Text("CALCULATE BMI")),
          )
        ],
      ),
    );
  }
}
