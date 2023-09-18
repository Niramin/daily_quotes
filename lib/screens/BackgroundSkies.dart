import 'package:daily_quotes/main.dart';
import 'package:daily_quotes/models/Poem.dart';
import 'package:daily_quotes/repository/PoemRepository.dart';
import 'package:daily_quotes/screens/Cards.dart';
import 'package:daily_quotes/screens/PoemContentDisplay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:math';
import 'package:rxdart/rxdart.dart';
import 'package:daily_quotes/models/SkyObjects.dart';

// State Provider
class SkyAppState extends ChangeNotifier {
  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
  var clock = Stream.periodic(const Duration(seconds: 1));
  var clockBroadcast = BehaviorSubject();

  SkyObject cloud0 = SkyObject("assets/images/cloud.png");

  SkyObject cloud1 = SkyObject("assets/images/cloud.png");

  SkyObject cloud2 = SkyObject("assets/images/cloud.png");

  bool isVisible = true;
  void setMaxXY(double x, double y) {
    cloud0.setScreenLimits(x, y);
    cloud1.setScreenLimits(x, y);
    cloud2.setScreenLimits(x, y);
  }

  void traverseLeft(double distance) {
    cloud0.traverseRight(distance: distance);
    cloud1.traverseRight(distance: distance);
    cloud2.traverseRight(distance: distance);
  }

  //Constructor
  SkyAppState() {
    clockBroadcast.listen((value) {
      traverseLeft(5);
      cloud0.seeRenderChecksRight();
      notifyListeners();
    });
    clock.listen((event) => clockBroadcast.add(0));
  }
}

class MorningSky extends StatefulWidget {
  const MorningSky({super.key, required this.mypoem});
  final Poem mypoem;

  @override
  State<MorningSky> createState() => _MorningSkyState();
}

class _MorningSkyState extends State<MorningSky> {
  bool isLike = false;
  Poems poemRepo = Poems();

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = intl.DateFormat('EEEE').format(DateTime.now());
    IconData icon;
    if (isLike) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return ChangeNotifierProvider(
      create: (context) => SkyAppState(),
      child: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          backgroundColor: Colors.pink.shade100,
          title: Center(
              child: Text(
            dayOfWeek,
            style: const TextStyle(
              fontFamily: 'MedievalSharp',
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent,
              fontSize: 40,
            ),
          )),
        ),
        body: Stack(
          children: [
            const Clouds(),
            FrontDisplay(widget: widget),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  isLike = !isLike;
                });
              },
              tooltip: 'Like',
              backgroundColor: Colors.pink.shade100,
              foregroundColor: Colors.limeAccent,
              child: Icon(icon),
            ),
            const SizedBox(
              width: 70,
            ),
            FloatingActionButton(
              onPressed: () => {},
              tooltip: 'Shuffle',
              backgroundColor: Colors.pink.shade100,
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

class FrontDisplay extends StatelessWidget {
  const FrontDisplay({
    super.key,
    required this.widget,
    
  });

  final MorningSky widget;
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        TitleCard(mypoem: widget.mypoem),
        const SizedBox( height: 40,),
        const Image(
          image: AssetImage("assets/images/topBorder.png"),
        ),
        PoemContent(widget: widget),
        const Image(
          image: AssetImage("assets/images/bottomBorder.png"),
        ),
        const SizedBox( height: 70,),
      ],
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
  bool calledOnce = false;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<SkyAppState>();
    appState.setMaxXY(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    //initialise cloud
    var mycloud = appState.cloud0;
    var mycloud1 = appState.cloud1;
    var mycloud2 = appState.cloud2;
    if (calledOnce == false) {
      mycloud.randomPositionSpawn();
      mycloud1.randomPositionSpawn();
      mycloud2.randomPositionSpawn();
      calledOnce = true;
    }

    return Stack(
      children: [
        SkyObjectWidget(mycloud: mycloud),
        SkyObjectWidget(mycloud: mycloud1),
        SkyObjectWidget(mycloud: mycloud2),
      ],
    );
  }
}

class SkyObjectWidget extends StatelessWidget {
  const SkyObjectWidget({
    super.key,
    required this.mycloud,
  });

  final SkyObject mycloud;

  @override
  Widget build(BuildContext context) {
    if (mycloud.isVisible) {
      return AnimatedPositioned(
        duration: const Duration(seconds: 2),
        width: mycloud.width,
        height: mycloud.width,
        top: mycloud.y,
        left: mycloud.x,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mycloud.image_url),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
