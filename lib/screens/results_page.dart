import 'file:///C:/Users/batuh/FlutterProjects/bmi_calculator/lib/components/bottom_button.dart';
import 'file:///C:/Users/batuh/FlutterProjects/bmi_calculator/lib/components/reusable_card.dart';
import 'package:bmi_calculator/calculate_brain.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.calculatorBrain});

  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "YOUR RESULT",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      calculatorBrain.getResult(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      calculatorBrain.calculateBMI(),
                      style: kBMITextStyle,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        calculatorBrain.getInterpretation(),
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            page: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
