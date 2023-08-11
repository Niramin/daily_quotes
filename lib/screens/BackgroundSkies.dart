import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class MorningSky extends StatelessWidget {
  const MorningSky({super.key});

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          dayOfWeek,
          style: const TextStyle(
            fontFamily: 'MedievalSharp',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )),
      ),
      body: Container(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Like',
            backgroundColor: Colors.brown.shade400,
            foregroundColor: Colors.limeAccent,
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 70,
          ),
          FloatingActionButton(
            onPressed: () => {},
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
