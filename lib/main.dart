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
      //bg color
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade600,
        title: Center(
          child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontFamily: 'MedievalSharp',
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent,
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
            child: PoemWithTitle(),
          ),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _toggleLike,
            tooltip: 'Like',
            backgroundColor: Colors.brown.shade400,
            foregroundColor: Colors.limeAccent,
            child: Icon(icon),
          ),
          const SizedBox(
            width: 70,
          ),
          FloatingActionButton(
            onPressed: _showRandomLikedPoem,
            tooltip: 'Shuffle',
            backgroundColor: Colors.brown.shade400,
            foregroundColor: Colors.limeAccent,
            child: const Icon(Icons.shuffle),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PoemWithTitle extends StatelessWidget {
  const PoemWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          //card color
          color: Colors.pink.shade100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
            child: Column(
              children: [
                Text(
                  'Krishna\'s Power',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontFamily: 'Satisfy',
                      color: Color.fromARGB(255, 4, 23, 95)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Indian Mythology',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Color.fromARGB(255, 4, 23, 95)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
            'Now I am become Death,\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!\n the destroyer of worlds!',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontFamily: 'Nunito Sans')),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
