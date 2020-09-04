import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const customColor = Color(0xFF1D1E33);
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
                Expanded(child: ReusableCard(color: customColor)),
                Expanded(child: ReusableCard(color: customColor)),
              ],
            ),
          ),
          Expanded(child: ReusableCard(color: customColor)),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(color: customColor)),
                Expanded(child: ReusableCard(color: customColor)),
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

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15.0)),
    );
  }
}

/*
* Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(color: Color(0xFF1D1E33))),
                Expanded(child: ReusableCard(color: Color(0xFF1D1E33))),
              ],
            ),
          ),
          Expanded(
            child: Expanded(child: ReusableCard(color: Color(0xFF1D1E33))),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(color: Color(0xFF1D1E33))),
                Expanded(child: ReusableCard(color: Color(0xFF1D1E33))),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            width: double.infinity,
            child: FlatButton(
                onPressed: () {},
                child: Center(
                  child: Text("Calculate BMI"),
                )),
          )
        */
