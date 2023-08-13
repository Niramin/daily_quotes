import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:math';
import 'package:rxdart/rxdart.dart';

// State Provider
class SkyAppState extends ChangeNotifier {
  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
  int noOfCloud = 0;
  bool listenToClock = false;
  var clock = Stream.periodic(const Duration(seconds: 1));
  var clockBroadcast = BehaviorSubject();
  double cloud_width = 50;
  double cloud_height = 200;
  double cloud_dist_from_left = 0;
  double cloud_dist_from_top = 51;

  double screen_max_width = 700;

  double screen_max_height = 900;

  bool isVisible = true;
  void setMaxXY(double x, double y) {
    screen_max_height = y;
    screen_max_width = x;
  }

  void setCloudPostion(double x, double y) {
    cloud_dist_from_top = y;
    cloud_dist_from_left = x;
  }

  void setCloudRandomSize() {
    cloud_width = next(50, 300) as double;
    cloud_height = next(200, 400) as double;
  }

  void traverseLeft(double distance) {
    cloud_dist_from_left += distance;
  }

  void toggleListeningToClock() {
    listenToClock = !listenToClock;
  }

  //Constructor
  SkyAppState() {
    noOfCloud = next(1, 6);
    clockBroadcast.listen((value) {
      if (true) {
        traverseLeft(5);
        if (cloud_dist_from_left < 0) {
          isVisible = true;
        }
        if (cloud_dist_from_left > screen_max_width) {
          isVisible = false;
        }
        if (cloud_dist_from_left > screen_max_width + 20) {
          cloud_dist_from_left = -50;
        }
        notifyListeners();
        print("$cloud_dist_from_left");
      }
    });
    clock.listen((event) => clockBroadcast.add(0));
    // clock.listen((event) {
    //   print("hi");
    // });
  }
}

class MorningSky extends StatelessWidget {
  const MorningSky({super.key});

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
    return ChangeNotifierProvider(
      create: (context) => SkyAppState(),
      child: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade400,
          title: Center(
              child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontFamily: 'MedievalSharp',
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent,
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
              backgroundColor: Colors.grey.shade400,
              foregroundColor: Colors.limeAccent,
              child: const Icon(Icons.favorite),
            ),
            const SizedBox(
              width: 70,
            ),
            FloatingActionButton(
              onPressed: () => {},
              tooltip: 'Shuffle',
              backgroundColor: Colors.grey.shade400,
              foregroundColor: Colors.limeAccent,
              child: const Icon(Icons.shuffle),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
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
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<SkyAppState>();
    //initialise cloud
    appState.setMaxXY(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Visibility(
      visible: appState.isVisible,
      child: AnimatedPositioned(
        duration: const Duration(seconds: 2),
        width: appState.cloud_width,
        height: appState.cloud_width,
        top: appState.cloud_dist_from_top,
        left: appState.cloud_dist_from_left,
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
