import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle(fontFamily: 'Poppins', color: Color(0xFF311B92));
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400);
  static final titleTextStyle = baseTextStyle.copyWith(
      fontSize: 18.0, fontWeight: FontWeight.w600);
  static final headerTextStyle = baseTextStyle.copyWith(
      fontSize: 20.0, fontWeight: FontWeight.w400);
  static final buttonTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w400);
}
