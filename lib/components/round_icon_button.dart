import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.pressed});

  final IconData iconData;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
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
