import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  IconData icon;
  FontWeight weight;

  AppTitle(
      {required this.text,
      required this.fontSize,
      required this.color,
      required this.icon,
      this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    if (text.length > 20) {
      text = text.substring(0, 20) + '...';
    }
    return Row(children: [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          icon,
          color: color,
          size: fontSize,
        ),
      ),
      SelectableText(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: weight,
        ),
      )
    ]);
  }
}
