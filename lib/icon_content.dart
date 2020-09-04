import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.description});

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
          ),
          Text(
            "$description",
            style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
          ),
        ]);
  }
}
