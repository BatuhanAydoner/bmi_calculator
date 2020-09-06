import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
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
              margin: EdgeInsets.all(15.0),
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
                      "OVERWEIGHT",
                      style: kResultTextStyle,
                    ),
                    Text(
                      "28.4",
                      style: kBMITextStyle,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "You have a higher than normal body weight. Try to exercise more.",
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
