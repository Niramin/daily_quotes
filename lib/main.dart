import 'package:daily_quotes/repository/PoemRepository.dart';
import 'package:daily_quotes/repository/irepository.dart';
import 'package:daily_quotes/repository/samplerepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:daily_quotes/screens/BackgroundSkies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    irepository poemRepo = PoemRepo();
    return MaterialApp(
      title: 'Daily Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MorningSky(mypoem: poemRepo.getRandomPoem()),
    );
  }
}
