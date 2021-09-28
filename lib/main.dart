import 'package:casanareapp/pages/home.pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(52, 26, 121, 1),
      100: Color.fromRGBO(52, 26, 121, 1),
      200: Color.fromRGBO(52, 26, 121, 1),
      300: Color.fromRGBO(52, 26, 121, 1),
      400: Color.fromRGBO(52, 26, 121, 1),
      500: Color.fromRGBO(52, 26, 121, 1),
      600: Color.fromRGBO(52, 26, 121, 1),
      700: Color.fromRGBO(52, 26, 121, 1),
      800: Color.fromRGBO(52, 26, 121, 1),
      900: Color.fromRGBO(52, 26, 121, 1),
    };
    return MaterialApp(
      //Pagina principal CasanareApp

      home: HomePage(),
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF341A79, color),
      ),
    );
  }
}
