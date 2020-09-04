import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const buttonColor = Color(0xFFEB1555);

class InputAge extends StatefulWidget {
  @override
  _InputAgeState createState() => _InputAgeState();
}

class _InputAgeState extends State<InputAge> {
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
                    color: activeCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      description: "MALE",
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  color: activeCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    description: "FEMALE",
                  ),
                )),
              ],
            ),
          ),
          Expanded(child: ReusableCard(color: activeCardColor)),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(color: activeCardColor)),
                Expanded(child: ReusableCard(color: activeCardColor)),
              ],
            ),
          ),
          Container(
            color: buttonColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: bottomContainerHeight,
            child: FlatButton(onPressed: () {}, child: Text("CALCULATE BMI")),
          )
        ],
      ),
    );
  }
}
