import 'package:daily_quotes/models/Poem.dart';
import 'package:daily_quotes/repository/PoemRepository.dart';
import 'package:daily_quotes/repository/irepository.dart';
import 'package:daily_quotes/repository/samplerepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:daily_quotes/screens/BackgroundSkies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Poem _poem = Poem();
   irepository poemRepo = Poems();

   @override
  void initState() {
    super.initState();
    loadPoem();
    
  }
  
  Future<void> loadPoem() async {
    Poem tpoem = await poemRepo.getRandomPoemAsync();
    setState(() {
      _poem = tpoem;
    });
  }

  @override
  Widget build(BuildContext context) {
    //loadAsset();
    return MaterialApp(
      title: 'Daily Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MorningSky(mypoem: _poem),
    );
  }
}
