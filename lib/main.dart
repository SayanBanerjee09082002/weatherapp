import 'package:flutter/material.dart';
import 'package:weather/loadingScreen.dart';
import 'HomeScreen.dart';

void main() {
  runApp(Weather());
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}




