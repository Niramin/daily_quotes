import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLiked = false;
  IconData icon = Icons.favorite_border;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        icon = Icons.favorite;
      } else {
        icon = Icons.favorite_border;
      }
    });
  }

  void _showRandomLikedPoem() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontFamily: 'MedievalSharp',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Krishna\'s Power',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' from Indian Mythology ',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Now I am become Death,\n the destroyer of worlds!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _toggleLike,
            tooltip: 'Like',
            child: Icon(icon),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: _showRandomLikedPoem,
            tooltip: 'Like',
            child: const Icon(Icons.shuffle),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
