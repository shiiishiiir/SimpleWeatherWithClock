import 'package:flutter/material.dart';
import 'package:weatherclock/HomePage.dart';
import 'package:weatherclock/WeatherAPI.dart';
import 'package:weatherclock/WeatherAPITwo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WeatherAPICall(),
    );
  }
}

