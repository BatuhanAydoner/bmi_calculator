import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, this.page});

  final String buttonTitle;
  final Function page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: page,
      child: Container(
        color: kButtonColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
            child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
