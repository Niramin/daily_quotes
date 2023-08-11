import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class MorningSky extends StatelessWidget {
  const MorningSky({super.key});

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
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
      body: Stack(
        children: [
          Clouds(),
          Center(
            child: Text(
              "Sample Text\nSample Text\nSample Text\nSample Text\nSample Text\n",
            ),
          ),
        ],
      ),
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

class Clouds extends StatefulWidget {
  const Clouds({
    super.key,
  });

  @override
  State<Clouds> createState() => _CloudsState();
}

class _CloudsState extends State<Clouds> {
  double cur_x = 0.0;
  double cur_y = 51.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 2),
      width: 50.0,
      height: 200.0,
      top: 51,
      left: cur_x,
      child: GestureDetector(
        onTap: () {
          setState(() {
            cur_x += 10.0;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/cloud.png"),
            ),
          ),
        ),
      ),
    );
  }
}
