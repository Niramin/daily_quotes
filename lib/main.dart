import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lit_starfield/lit_starfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
